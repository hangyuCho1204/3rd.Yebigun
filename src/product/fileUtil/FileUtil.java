package product.fileUtil;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;


public class FileUtil {
	//���� ������ ����� ������ ���� �̸��� �����ؼ� ������ �޼ҵ� ����
	public String makeSavedFileName(String orignalFileName){
		
		//UUID�� ������ ���̵� ����� �ִ� Ŭ����
		UUID uid = UUID.randomUUID();
		
		String savedFile = uid.toString()+"_"+orignalFileName;
		
		return savedFile;
	}
	
	public boolean saveFile(String saveFileName, String uploadPath, byte[] fileData){
		//byte[]�� ���� ������
		//String uploadPath="c:\\xyz\\upload";
		
		File target = new File(uploadPath, saveFileName);
		
		try {
			FileCopyUtils.copy(fileData,  target);
			//������ �����͸� ������ �ִ� �޼ҵ�
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return false;
			//���� ������ �ȵ� �� ������ ��ȯ
		}
		return true;
		//���� ������ �� �� ���� ��ȯ
	}
	
	public boolean deleteSavedFile(String savedFileName){
		
		String uploadPath="c:\\xyz\\upload";
		File a = new File(uploadPath, savedFileName);
		boolean result = a.delete();
		
		return result;
	}
	
}
