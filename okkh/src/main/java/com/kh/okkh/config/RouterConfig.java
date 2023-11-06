//package com.kh.okkh.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.http.MediaType;
//import org.springframework.web.reactive.function.server.RequestPredicates;
//import org.springframework.web.reactive.function.server.RouterFunction;
//import org.springframework.web.reactive.function.server.RouterFunctions;
//import org.springframework.web.reactive.function.server.ServerResponse;
//
//
//public class RouterConfig {
//	
//	@Bean
//	public RouterFunction<ServerResponse> routes(Handler handler) {
//	    return RouterFunctions.route(RequestPredicates.GET("/hello")
//	      .and(RequestPredicates.accept(MediaType.TEXT_PLAIN)), 
//	        handler::handleRequest);
//	    }
//
//
//}
