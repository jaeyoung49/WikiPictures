package org.kosta.wikipictures.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	

	public CustomLoginSuccessHandler() {
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
    		Authentication authentication) throws ServletException, IOException {
    	super.setDefaultTargetUrl(request.getHeader("Referer"));
    	super.onAuthenticationSuccess(request, response, authentication);
    }

    
    
	
}
