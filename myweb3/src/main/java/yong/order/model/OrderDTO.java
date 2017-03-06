package yong.order.model;

import java.util.*;

public class OrderDTO {
	
	private List<ItemDTO> itemdto;
	private MarketInfo marketinfo;	
	//markerinfo는 하나지만 itemDTO는 하나이상의 상품을 관리해야 함. -> list로 관리
	
	public OrderDTO() {
		super();
	}
	
	public OrderDTO(List<ItemDTO> itemdto, MarketInfo marketinfo) {
		super();
		this.itemdto = itemdto;
		this.marketinfo = marketinfo;
	}
	
	public List<ItemDTO> getItemdto() {
		return itemdto;
	}
	
	public void setItemdto(List<ItemDTO> itemdto) {
		this.itemdto = itemdto;
	}
	
	public MarketInfo getMarketinfo() {
		return marketinfo;
	}
	
	public void setMarketinfo(MarketInfo marketinfo) {
		this.marketinfo = marketinfo;
	}	
	

}
