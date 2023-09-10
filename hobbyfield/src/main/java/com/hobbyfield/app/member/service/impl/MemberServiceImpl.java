package com.hobbyfield.app.member.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.board.service.ClubCommentVO;
import com.hobbyfield.app.club.like.service.ClubBoardLikeVO;
import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.common.MailUtils;
import com.hobbyfield.app.common.TempKey;
import com.hobbyfield.app.member.mapper.MemberMapper;
import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.prdt.service.PrdtVO;


@Service
@PropertySource("classpath:/config/key.properties")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper memberMapper;
	
	@Value("${key.KAKAO}")
	private String kakaoKey;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	public int insertMember(MemberVO memberVO) {

		return memberMapper.insertMember(memberVO);
	}

	@Override
	public int chkMemberEmail(String memberEmail) {
	
		return memberMapper.chkMemberEmail(memberEmail);
	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) {

		return memberMapper.loginMember(memberVO);
	}

	@Override
	public int updateMemberLtst(MemberVO memberVO) {

		return memberMapper.updateMemberLtst(memberVO);
	}

	@Override
	public int updateMemberPnt(MemberVO memberVO) {

		return memberMapper.updateMemberPnt(memberVO);
	}

	@Override
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=" + kakaoKey); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost/app/member/kakaoLogin"); // 본인이 설정한 주소
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	@Override
	public int updateMember(MemberVO memberVO) {

		return memberMapper.updateMember(memberVO);
	}
	
	@Override
	public String chkMemberPwd(String memberEmail) {
		
		return memberMapper.chkMemberPwd(memberEmail);
	}

	@Override
	public void updateMemberPwd(String memberEmail, String encodePwd) {
		
		memberMapper.updateMemberPwd(memberEmail, encodePwd);
	}


	@Override
	public void deleteMember(String memberEmail) {

		memberMapper.deleteMember(memberEmail);
	}

	@Override
	public List<CreateclubVO> selectJoinClub(MemberVO memberVO) {

		return memberMapper.selectJoinClub(memberVO);
	}

	@Override
	public List<PrdtVO> selectSellList(MemberVO memberVO) {

		return memberMapper.selectSellList(memberVO);
	}

	@Override
	public int findPwCheck(MemberVO memberVO) throws Exception {

		return memberMapper.findPwCheck(memberVO);
	}


	@Override
	public void findPw(String memberEmail, String memberNm) throws Exception {
		String memberKey = new TempKey().getKey(6, false);
		String memberPwd = BCrypt.hashpw(memberKey, BCrypt.gensalt());
		memberMapper.findPw(memberEmail, memberNm, memberPwd);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("HobbyField 임시 비밀번호입니다.");
		sendMail.setText(
				"<h1>임시 비밀번호 발급</h1>" +
				"<br />" + memberNm + "님" +
				"<br />임시 비밀번호 :  <h2>" + memberKey + "</h2>" +
				"<br /> 로그인 후 비밀번호 변경을 해 주세요." +
				"<a href='http://localhost/app/member/login" +
				"> 로그인 페이지 </a>");
		sendMail.setFrom("fleurnari2@gmail.com", "HobbyField");
		sendMail.setTo(memberEmail);
		sendMail.send();
	}

	@Override
	public List<ClubBoardVO> selectMyClubBoard(String memberEmail) {

		return memberMapper.selectMyClubBoard(memberEmail);
	}

	@Override
	public List<ClubCommentVO> selectMyClubComment(String memberEmail) {

		return memberMapper.selectMyClubComment(memberEmail);
	}

	@Override
	public List<ClubBoardLikeVO> selectMyClubLike(String memberEmail) {

		return memberMapper.selectMyClubLike(memberEmail);
	}
}
