package com.hobbyfield.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.csboard.reply.service.ReplyService;
import com.hobbyfield.app.csboard.reply.service.ReplyVO;

import lombok.AllArgsConstructor;

@RequestMapping("replies/")
@RestController
@AllArgsConstructor
public class ReplyController {
	private ReplyService replyService;
	
	
	//댓글등록, consumes와 MediaType => 정해진 타입의 데이터들만 받기 위함.
	@PostMapping(value="/new", consumes = "application/json"
			, produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO replyVO) {
		// @RequestBody는 json 형태로 받은 값을 객체로 변환한다.
		int insertCount = replyService.insert(replyVO);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		// ResponseEntity : 웹페이지 생성(상태, 헤더, 응답, 데이터)
		// 3항 연산자 이용. (잘 모르겠음)
		// HttpStatus 페이지 상태를 전달.
		// 리턴의 코드는 정상 처리되면 정상 처리 된 상태(status)를 전달하고, 아니면 오류상태(status) 전달한다는 의미
	}
	
	//목록
	@GetMapping(value="/pages/{csNumber}/{page}", produces= {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE
	})
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("csNumber") Long csNumber
			) {
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(replyService.getListWithPaging(cri, csNumber), HttpStatus.OK);
	}
	
	
	
	//조회
	@GetMapping(value="/{rno}", produces= {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno ) 
	{
			
		return new ResponseEntity<>(replyService.read(rno), HttpStatus.OK);
	}
	
	//삭제
	@DeleteMapping(value="/{rno}", produces = {
			MediaType.TEXT_PLAIN_VALUE
	}) 
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		return replyService.delete(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{rno}",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO replyVO,
			@PathVariable("rno") Long rno) {
		replyVO.setRno(rno);
		
		return replyService.update(replyVO) == 1
				? new ResponseEntity<> ("success", HttpStatus.OK)
						: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
