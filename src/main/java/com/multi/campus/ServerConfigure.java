package com.multi.campus;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;
import java.util.List;

@Configuration
public class ServerConfigure implements WebMvcConfigurer { //MVC Configurer 인터페이스 상속!
    //final변수 대문자. Arrays.asList() 배열을 List로 변환하는 데 사용
    private static final List<String> URL_PATTERNS = Arrays.asList(
			"/board/writeOk",
			"/board/editOk",
			"/board/delete",

			"/customer/delete",
			"/customer/customerWrite",
			"/customer/myquestion"



    );

    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS);

    }

}
