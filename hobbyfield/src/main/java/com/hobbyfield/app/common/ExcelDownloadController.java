package com.hobbyfield.app.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hobbyfield.app.fnd.service.FundingSupportService;
import com.hobbyfield.app.fnd.service.FundingSupportVO;
import com.hobbyfield.app.common.SearchCriteria;

@Controller
public class ExcelDownloadController {
    
    @Autowired
    private FundingSupportService fundingSupportService;

    @GetMapping("/downloadExcel")
    public void downloadExcel(HttpServletResponse response, HttpServletRequest request, SearchCriteria scri, Model model) throws IOException {
        String fndPostNumber = request.getParameter("fndPostNumber");
        
        // 엑셀 워크북 생성
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("후원 목록");

        // 데이터를 생성하고 엑셀에 추가
        Row headerRow = sheet.createRow(0);
        String[] headers = {"후원번호", "총 결제 금액", "구매자 ID", "수신자", "주문날짜", "주문수량", "주소", "연락처", "요청사항", "송장번호", "주문상태"};
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
        }

        // 펀딩 후원 데이터 가져오기
        FundingSupportVO fundingSupportVO = new FundingSupportVO();
        fundingSupportVO.setFndPostNumber(Integer.parseInt(fndPostNumber)); // fndPostNumber 설정
        List<FundingSupportVO> fundingSupportList = fundingSupportService.supportManagement(fundingSupportVO, scri);
        model.addAttribute("supportManagement", fundingSupportList);
        // 엑셀 데이터 채우기
        int rowNum = 1;
        for (FundingSupportVO support : fundingSupportList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(support.getFndSupportNumber());
            row.createCell(1).setCellValue(support.getFndTotalPrice());
            row.createCell(2).setCellValue(support.getMemberEmail());
            row.createCell(3).setCellValue(support.getFndOrderRecipient());
            row.createCell(4).setCellValue(support.getFndOrderDate());
            row.createCell(5).setCellValue(support.getFndOrderAmount());
            row.createCell(6).setCellValue(support.getFndZip() + " " + support.getFndBaseAddr() + " " + support.getFndDetaAddr());
            row.createCell(7).setCellValue(support.getFndCntinfo());
            row.createCell(8).setCellValue(support.getFndOrderRequest());
            row.createCell(9).setCellValue(support.getFndInvoice());
         // 주문상태에 따라 문자열 설정
            String orderStatus = "";
            int status = support.getFndOrderState();
            if (status == 1) {
                orderStatus = "배송준비중";
            } else if (status == 2) {
                orderStatus = "배송중";
            } else if (status == 3) {
                orderStatus = "배송완료";
            }
            row.createCell(10).setCellValue(orderStatus);
        }

        // HTTP 응답 설정
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=supportList.xlsx");

        // 엑셀 파일을 클라이언트에게 전송
        workbook.write(response.getOutputStream());
        workbook.close();
    }
}