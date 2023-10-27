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
    //메시지를 중간에서 라우팅할 때 사용하는 메시지 브로커를 구성한다.
    public void configureMessageBroker(MessageBrokerRegistry registry){
        registry.enableSimpleBroker("/sub"); //해당 주소를 구독하는 클라이언트에게 메시지를 보낸다
        registry.setApplicationDestinationPrefixes("/pub"); // /pub로 시작하는 메시지만 해당 Broker에서 받아서 처리한다.
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry){
        registry.addEndpoint("/okkh/chat") // ex) ws//localhost:7777/okkh/chatting
        		.setAllowedOrigins("*")
        		.withSockJS(); // .withSockJS();
    }
    
}
