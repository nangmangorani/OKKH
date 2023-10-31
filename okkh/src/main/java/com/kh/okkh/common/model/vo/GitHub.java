package com.kh.okkh.common.model.vo;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * GithubTemplate 호출을 위해 필요한 매개변수 객체VO
 * 
 * @author Target
 *
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class GitHub {
	
	private String token;	// access_token 값
	private String method;	// 요청방식(GET, POST, PUT, PATCH, DELETE)
	private String uri;		// Base Url 뒤에 추가할 URI(/XX/XX 형식으로 들어감)
//	private String params;
	private Map<String, Object> params;	// Body에 요청할 매개변수들

}
