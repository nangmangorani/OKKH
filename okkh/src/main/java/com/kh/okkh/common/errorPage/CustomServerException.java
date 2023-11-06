package com.kh.okkh.common.errorPage;

import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

public class CustomServerException extends ResponseStatusException {

    public CustomServerException(String reason) {
        super(HttpStatus.INTERNAL_SERVER_ERROR, reason);
    }
}
