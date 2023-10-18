//package com.kh.okkh.member.controller;
//
//import java.io.BufferedReader;
//import java.io.BufferedWriter;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.io.OutputStreamWriter;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//import lombok.extern.slf4j.Slf4j;
//
//
//@Slf4j
//@Controller
//public class GitController {
//	
//	@GetMapping("callback")
//	public String getCode(@RequestParam String code, HttpSession session) throws IOException {
//	    
//		URL url = new URL("https://github.com/login/oauth/access_token");
//		
//		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//		conn.setDoInput(true); // InputStream으로 서버로 부터 응답을 받겠다는 옵션.
//		conn.setDoOutput(true); // OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
//		conn.setRequestMethod("POST"); // 요청 방식 선택 (GET, POST)
//		conn.setRequestProperty("Accept", "application/json"); // 서버 Response Data를 JSON 형식의 타입으로 요청
//		conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36");
//		
//		try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {
//            bw.write("client_id=547efc5d4e288fcead15&client_secret=0288645695df6c3a1a34a989d71199131f84e7c9&code=" + code);
//            bw.flush();
//        }
//
//        int responseCode = conn.getResponseCode();
//
//        String responseData = getResponse(conn, responseCode);
//
//        conn.disconnect();
//
//        log.info("Response from GitHub token request: {}", responseData);
//        
//        return "redirect:/";
//    }
//	
//	public void access(String response, RedirectAttributes redirectAttributes) throws IOException {
//
//        ObjectMapper objectMapper = new ObjectMapper();
//        Map<String, String> map = objectMapper.readValue(response, Map.class);
//        String access_token = map.get("access_token");
//
//        URL url = new URL("https://api.github.com/user");
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("GET");
//        conn.setRequestProperty("Accept", "application/json");
//        conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36");
//        conn.setRequestProperty("Authorization", "token " + access_token); // Request Header값 셋팅 setRequestProperty(String key, String value)
//        
//        int responseCode = conn.getResponseCode();
//
//        String result = getResponse(conn, responseCode);
//
//        conn.disconnect();
//
//        log.info("Response from GitHub user info request: {}", result);
//    }
//
//    private String getResponse(HttpURLConnection conn, int responseCode) throws IOException {
//        StringBuilder sb = new StringBuilder();
//        if (responseCode == 200) {
//            try (InputStream is = conn.getInputStream();
//                 BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
//                for (String line = br.readLine(); line != null; line = br.readLine()) {
//                    sb.append(line);
//                }
//            }
//        }
//        return sb.toString();
//    }
//
//}
