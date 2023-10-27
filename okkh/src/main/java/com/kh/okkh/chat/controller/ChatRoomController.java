package com.kh.okkh.chat.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatRoomController {
    private final ChatRoomRepository chatRoomRepository;

    //채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public ModelAndView rooms(){

        ModelAndView mv = new ModelAndView("chat/rooms");

        mv.addObject("list", chatRoomRepository.findAllRooms());

        return mv;
    }

    //채팅방 개설
    @PostMapping(value = "/room")
    public String create(@RequestParam String name, RedirectAttributes rttr){

        rttr.addFlashAttribute("roomName", chatRoomRepository.createChatRoomVO(name));
        return "redirect:/chat/rooms";
    }

    //채팅방 조회
    @GetMapping("/room")
    public void getRoom(String roomId, Model model){

        log.info("# get Chat Room, roomID : " + roomId);

        model.addAttribute("room", chatRoomRepository.findRoomById(roomId));
    }
}