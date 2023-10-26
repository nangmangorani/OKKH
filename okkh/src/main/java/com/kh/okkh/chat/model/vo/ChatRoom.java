package com.kh.okkh.chat.model.vo;

import java.sql.Date;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatRoom {
		private int roomNo;
		private String roomTitle;
		private Date createDate;
		private String status;
		private String lastChat;
		private Date lastDate;
		private int fileNo;
		
		private Set<WebSocketSession> sessions =  new Set<WebSocketSession>() {
			
			@Override
			public <T> T[] toArray(T[] a) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object[] toArray() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int size() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public boolean retainAll(Collection<?> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean removeAll(Collection<?> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean remove(Object o) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public Iterator<WebSocketSession> iterator() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean isEmpty() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean containsAll(Collection<?> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean contains(Object o) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public void clear() {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean addAll(Collection<? extends WebSocketSession> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean add(WebSocketSession e) {
				// TODO Auto-generated method stub
				return false;
			}
		};
}
