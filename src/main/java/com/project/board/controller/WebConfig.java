package com.project.board.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images1/**")
		.addResourceLocations("file:///upload/");

		/*registry.addResourceHandler("/images/**")
				.addResourceLocations("file:///Users/hyeonji/full_stack_study/upload/");*/
		/*
		 * registry.addResourceHandler("/voice/**")
		 * .addResourceLocations("file:///C:/upload/");
		 */
	}
}
