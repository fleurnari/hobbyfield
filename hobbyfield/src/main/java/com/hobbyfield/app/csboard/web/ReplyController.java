package com.hobbyfield.app.csboard.web;

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
	
	
	//��۵��, consumes�� MediaType => ������ Ÿ���� �����͵鸸 �ޱ� ����.
	@PostMapping(value="/new", consumes = "application/json"
			, produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO replyVO) {
		// @RequestBody�� json ���·� ���� ���� ��ü�� ��ȯ�Ѵ�.
		int insertCount = replyService.insert(replyVO);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		// ResponseEntity : �������� ����(����, ���, ����, ������)
		// 3�� ������ �̿�. (�� �𸣰���)
		// HttpStatus ������ ���¸� ����.
		// ������ �ڵ�� ���� ó���Ǹ� ���� ó�� �� ����(status)�� �����ϰ�, �ƴϸ� ��������(status) �����Ѵٴ� �ǹ�
	}
	
	//���
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
	
	
	
	//��ȸ
	@GetMapping(value="/{rno}", produces= {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno ) 
	{
			
		return new ResponseEntity<>(replyService.read(rno), HttpStatus.OK);
	}
	
	//����
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
