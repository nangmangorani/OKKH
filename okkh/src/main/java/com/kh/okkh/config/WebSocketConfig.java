package com.kh.okkh.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

  @Override
  public void configureMessageBroker(MessageBrokerRegistry config) {
    config.enableSimpleBroker("/topic"); // 클라이언트가 서버로부터 메시지를 받기위한 URL의 prefix 설정
    config.setApplicationDestinationPrefixes("/app"); // 클라이언트가 서버에게 메시지를 보내기 위한 URL의 prefix 설정
  }

  @Override
  public void registerStompEndpoints(StompEndpointRegistry registry) {
    registry.addEndpoint("/chat"); // 클라이언트와 서버가 connection(handshake)을 만들기 위한 endpoint 설정
    registry.addEndpoint("/chat")
    		.setAllowedOrigins("http://localhost:7777")
    		.withSockJS();
    		
    // /chat으로 시작하는 URL의 요청은 @Controller 클래스의 @MessageMapping 메소드로 전달된다.
  }

}