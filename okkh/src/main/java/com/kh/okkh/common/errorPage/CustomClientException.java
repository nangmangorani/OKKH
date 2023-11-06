package com.kh.okkh.common.errorPage;

import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

public class CustomClientException extends ResponseStatusException {

    public CustomClientException(String reason) {
        super(HttpStatus.BAD_REQUEST, reason);
    }
}

