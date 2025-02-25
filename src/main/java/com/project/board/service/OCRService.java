package com.project.board.service;

import java.io.BufferedReader;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class OCRService {
	public String clovaOCRService(String filePathName) {
		// API 복사
		String apiURL = "https://ix8vuazcqc.apigw.ntruss.com/custom/v1/14571/3c1cc0dc6781d93a406367b45476703fcf02a61326ec6dd024f4f0dbe46426d1/infer";
		String secretKey = "RWtxU01jSHVJR2pHUUpNQ1FNQkpYd1ZTSGdORXVkYmI=";
		String imageFile = filePathName;
		String result = "";

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response); // API 호출 결과를 콘솔에 출력
			
			// jsonToString() 메소드 호출하고 결과 받아옴
			result = jsonToString(response.toString());
			System.out.println(result); // 뭔가가 있는 줄 알았어요
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
		IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");
	
		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();
	
		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString
				.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();
	
			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}
	
			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
	
	public String jsonToString(String jsonResultStr) {
		String resultText = "";
		
		// API 호출 결과 받은 JSON 형태 문자열에서 텍스트 추출
		// JSONParser  사용하지 않음
		
		// images / 0 / fields / inferText 추출
		JSONObject jsonObj = new JSONObject(jsonResultStr);
		JSONArray imageArray = (JSONArray) jsonObj.get("images");		
		
		if(imageArray != null) {
			JSONObject tempObj = (JSONObject) imageArray.get(0);
			JSONArray fieldArray = (JSONArray) tempObj.get("fields");
			
			if(fieldArray != null) {
				for(int i=0; i<fieldArray.length(); i++) {
					tempObj = (JSONObject) fieldArray.get(i);
					resultText += (String) tempObj.get("inferText") + " ";
				}
			}
		} else {
			System.out.println("없음");
		}		
		
		return resultText;
	}
}
