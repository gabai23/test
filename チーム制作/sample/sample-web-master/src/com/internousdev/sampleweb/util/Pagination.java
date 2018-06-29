package com.internousdev.sampleweb.util;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.sampleweb.dto.PaginationDTO;
import com.internousdev.sampleweb.dto.ProductInfoDTO;

public class Pagination {

	public ArrayList<ArrayList<ProductInfoDTO>> paginate_old(List<ProductInfoDTO> productInfoDtoList,int pageNumber){
		int elementNumber = 0;
		ArrayList<ArrayList<ProductInfoDTO>> list = new ArrayList<>();
		list.add(new ArrayList<ProductInfoDTO>());
		for(int page=1; page<= productInfoDtoList.size(); page++){
			list.get(elementNumber).add(productInfoDtoList.get(page - 1));
				if(page % 9 == 0 && page != 0){
					elementNumber++;
					list.add(new ArrayList<ProductInfoDTO>());
				}
		}
		System.out.println(list);
		return list;
	}


	public PaginationDTO initialize(List<ProductInfoDTO> list, int pageSize) {

		PaginationDTO paginationDTO = new PaginationDTO();
		// 全ページ数
		paginationDTO.setTotalPageSize((int)(Math.ceil(list.size() / pageSize)));
		// 現在のページ番号
		paginationDTO.setCurrentPageNo(1);
		// 全レコード数
		paginationDTO.setTotalRecordSize(list.size() - 1);
		// 現在のページ番号に対する開始レコード番号（オフセット）
		paginationDTO.setStartRecordNo(pageSize * (paginationDTO.getCurrentPageNo() -1));
		// 現在のページ番号に対する終了レコード番号
		paginationDTO.setEndRecordNo(paginationDTO.getStartRecordNo() + (pageSize - 1));

		List<Integer> pageNumberList = new ArrayList<Integer>();
		for(int pageNumber = 1;pageNumber <= paginationDTO.getTotalPageSize(); pageNumber++) {
			pageNumberList.add(pageNumber);
		}

		List<ProductInfoDTO> productInfoPages = new ArrayList<ProductInfoDTO>();
		for(int pageNumberOffset=paginationDTO.getStartRecordNo(); pageNumberOffset <= paginationDTO.getEndRecordNo(); pageNumberOffset++) {
			productInfoPages.add(list.get(pageNumberOffset));
		}
		paginationDTO.setCurrentProductInfoPage(productInfoPages);

		if((paginationDTO.getStartRecordNo() - 1) <= 0) {
			paginationDTO.setPreviousPage(false);
		}else {
			paginationDTO.setPreviousPage(true);
			paginationDTO.setPreviousPageNo(paginationDTO.getCurrentPageNo() - 1);
		}

		if(paginationDTO.getEndRecordNo() + pageSize > paginationDTO.getTotalRecordSize()) {
			paginationDTO.setNextPage(false);
		}else {
			paginationDTO.setNextPage(true);
			paginationDTO.setNextPageNo(paginationDTO.getCurrentPageNo() + 1);
		}
		return paginationDTO;
	}


	public PaginationDTO getPage(List<ProductInfoDTO> list, int pageSize, String pageNo) {

		PaginationDTO paginationDTO = new PaginationDTO();
		// 全ページ数
		paginationDTO.setTotalPageSize((int)(Math.ceil(list.size() / pageSize)));
		// 現在のページ番号
		paginationDTO.setCurrentPageNo(Integer.parseInt(pageNo));
		// 全レコード数
		paginationDTO.setTotalRecordSize(list.size() - 1);
		// 現在のページ番号に対する開始レコード番号（オフセット）
		paginationDTO.setStartRecordNo(pageSize * (paginationDTO.getCurrentPageNo() -1));
		// 現在のページ番号に対する開始レコード番号
//		paginationDTO.setStartRecordNo((pageSize * paginationDTO.getCurrentPageNo()) + 1);
		// 現在のページ番号に対する終了レコード番号
		paginationDTO.setEndRecordNo(paginationDTO.getStartRecordNo() + (pageSize - 1));

		List<Integer> pageNumberList = new ArrayList<Integer>();
		for(int pageNumber = 1;pageNumber <= paginationDTO.getTotalPageSize(); pageNumber++) {
			pageNumberList.add(pageNumber);
		}

		List<ProductInfoDTO> productInfoPages = new ArrayList<ProductInfoDTO>();
		for(int pageNumberOffset=paginationDTO.getStartRecordNo(); pageNumberOffset <= paginationDTO.getEndRecordNo(); pageNumberOffset++) {
			productInfoPages.add(list.get(pageNumberOffset));
		}
		paginationDTO.setCurrentProductInfoPage(productInfoPages);

		if((paginationDTO.getStartRecordNo() - 1) <= 0) {
			paginationDTO.setPreviousPage(false);
		}else {
			paginationDTO.setPreviousPage(true);
			paginationDTO.setPreviousPageNo(paginationDTO.getCurrentPageNo() - 1);
		}

		if(paginationDTO.getEndRecordNo() + pageSize > paginationDTO.getTotalRecordSize()) {
			paginationDTO.setNextPage(false);
		}else {
			paginationDTO.setNextPage(true);
			paginationDTO.setNextPageNo(paginationDTO.getCurrentPageNo() + 1);
		}

		return paginationDTO;

	}

}