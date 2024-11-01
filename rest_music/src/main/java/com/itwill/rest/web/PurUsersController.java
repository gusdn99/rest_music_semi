package com.itwill.rest.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.rest.service.PurchaseService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
@RequestMapping("/purchase")
@RequiredArgsConstructor
public class PurUsersController {
	
	private final PurchaseService service;
	
	@GetMapping("/success/{loginUserId}")
	public ResponseEntity<Integer> PurchaseSuccess (@PathVariable Integer loginUserId, HttpSession session) {
		log.debug("controller ({})",loginUserId);
		int result = service.PurchaseSuccess(loginUserId);
		session.setAttribute("refresh", "Y");
		return ResponseEntity.ok(result);
	}

	@GetMapping("/isPurUser")	
	public ResponseEntity<Boolean> isPurchaseUser(@RequestParam(value="id") String id) {
		log.debug("isPurchaseUser()");
		boolean result = service.isPurchaseUser(Integer.parseInt(id));
		log.debug("result = {}", result);
		return ResponseEntity.ok(result);		
	}
	
	
}
