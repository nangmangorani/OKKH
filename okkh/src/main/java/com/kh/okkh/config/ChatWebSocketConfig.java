package com.kh.okkh.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.kh.okkh.chat.controller.ChatWebsocketHandler;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class ChatWebSocketConfig implements WebSocketConfigurer {
	
	private final ChatWebsocketHandler chatHandler;
    
	@Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    	registry.addHandler(chatHandler, "/okkh/chat")
    			.setAllowedOrigins("http://192.168.20.57:7777")
    			.withSockJS();
    }
}
