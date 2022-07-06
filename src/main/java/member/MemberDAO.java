package member;

import java.sql.*;
import java.util.ArrayList;

import DBPKG.DBConnection;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
		public MemberDAO() {
			try {
				con = DBConnection.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public ArrayList<MemberDTO> getMembers() {
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			String sql = "select * from member_tbl_02";
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setCustno(rs.getInt("custno"));
					dto.setCustname(rs.getString("custname"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("address"));					
					dto.setJoindate(rs.getDate("joindate"));
					dto.setGrade(rs.getString("grade"));
					dto.setCity(rs.getString("city"));
					list.add(dto);					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return list;			
		}
		
		public int lastnum() {
			String sql = "select max(custno) from member_tbl_02";
			int num = 0;
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					num = rs.getInt("max(custno)");
					System.out.println(num);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return num+1;
		}
		
		
		public int register(String custname, String phone,String address, String joindate,String grade,String city) {
			int no = lastnum();
			String sql = "insert into member_tbl_02 values("+no+",?,?,?,?,?,?)";
			int r = 0;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, custname);
				ps.setString(2, phone);
				ps.setString(3, address);				
				ps.setString(4, joindate);
				ps.setString(5, grade);
				ps.setString(6, city);				
				r = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return r;
		}
		
		public ArrayList<MemberDTO> sell() {
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			String sql="select mem.custno,mem.custname,mem.grade,sum(mon.price) "
					+ "from member_tbl_02 mem inner join money_tbl_02 mon "
					+ "on mem.custno = mon.custno group by mem.custno,mem.custname,mem.grade order by sum(price) desc";
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setCustno(rs.getInt("custno"));
					dto.setCustname(rs.getString("custname"));
					dto.setGrade(rs.getString("grade"));
					dto.setPrice(rs.getInt("sum(mon.price)"));
					if(dto.getPrice()!=0) {
						list.add(dto);	
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public int modify(String custname,String phone,String address,String joindate, String grade, String city,String custno ) {
			String sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";
			int m = 0;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, custname);
				ps.setString(2, phone);
				ps.setString(3, address);
				ps.setString(4, joindate);
				ps.setString(5, grade);
				ps.setString(6, city);
				ps.setString(7, custno);
				m = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();			
			}
			System.out.println(m);
			return m;
		}
		
		public MemberDTO getUser(String custno) {
			String sql = "select * from member_tbl_02 where custno=?";
			MemberDTO dto = new MemberDTO();
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, custno);
				rs= ps.executeQuery();
				while(rs.next()) {
					dto.setCustno(rs.getInt("custno"));
					dto.setCustname(rs.getString("custname"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("address"));
					dto.setJoindate(rs.getDate("joindate"));
					dto.setGrade(rs.getString("grade"));
					dto.setCity(rs.getString("city"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return dto;
		}
		
		
		
}
