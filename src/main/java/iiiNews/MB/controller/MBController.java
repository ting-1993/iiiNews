package iiiNews.MB.controller;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import iiiNews.MB.model.ForgetBean;
import iiiNews.MB.model.LoginBean;
import iiiNews.MB.model.MBBean;
import iiiNews.MB.service.MBService;
import iiiNews.MB.validate.LoginBeanValidator;

@Controller
@SessionAttributes("MBBean")
public class MBController {
	@Autowired
	ServletContext ctx;
	@Autowired
	MBService service;
	
	@RequestMapping(value = "/Forget", method = RequestMethod.GET)
	public String forget() {
		return new String("/MB/Forget");
	}
	
	@RequestMapping(value = "/LoginMB", method = RequestMethod.GET)
	public String login() {
		return new String("/MB/LoginMB");
	}

	@RequestMapping(value = "/UserMB", method = RequestMethod.GET)
	public String usermb() {
		return new String("/MB/UserMB");
	}

	@RequestMapping(value = "/Member", method = RequestMethod.GET)
	public ModelAndView student() {
		return new ModelAndView("/MB/Member", "command", new MBBean());
	}

	@RequestMapping(value = "/Member", method = RequestMethod.POST)
	public String adduser(@ModelAttribute("command") MBBean user, Model model) {
		service.addMember(user);
//       System.out.println(user.getSex());
//       System.out.println(user.getName());
//      model.addAttribute("memberId", user.getMemberId());
//      model.addAttribute("phone", user.getPhone());
//      model.addAttribute("email", user.getEmail());
//      model.addAttribute("password", user.getPassword());
//      model.addAttribute("name", user.getName());
//      model.addAttribute("repassword", user.getOkPassword());
//      model.addAttribute("sex", user.getSex());
//      model.addAttribute("identityId", user.getIdentityId());
//      model.addAttribute("birthday", user.getBirthday());
//      model.addAttribute("mbpoints", user.getMbpoints());
//      
		model.addAttribute("mb", user);
		return "/MB/UserList";
	}
	
	@GetMapping("/Login")
	public String LoginContext(HttpServletRequest request, Model model,
			@CookieValue(value = "user", required = false) String user,
			@CookieValue(value = "password", required = false) String password,
			@CookieValue(value = "rm", required = false) Boolean rm) {
		if (user == null)
			user = "";
		if (password == null) {
			password = "";
		}
		if (rm != null) {
			rm = Boolean.valueOf(rm);
		} else {
			rm = false;
		}
		LoginBean lb = new LoginBean(user, password, rm);
		model.addAttribute("LoginBean", lb);

		return "MB/Login";
	}
	
	@PostMapping("/Login")
	public String LoginContextCheck(@ModelAttribute("LoginBean") LoginBean lb, Model model, BindingResult result,
			HttpServletRequest request, HttpServletResponse response) {

		MBBean mmm = service.login(lb.getUserId(), lb.getPassword());

		LoginBeanValidator validator = new LoginBeanValidator();
		validator.validate(lb, result);
		if (result.hasErrors()) {

			return "MB/Login";
		} else if (mmm == null) {
			result.rejectValue("invalidCredentials", "", "*該帳號不存在或密碼錯誤");
			return "MB/Login";
		} else {
			model.addAttribute("MBBean", mmm);
			mmm = (MBBean) model.getAttribute("MBBean");
			if (mmm.getPassword().equals("1234")) {
				processCookies(lb, request, response);
				return "redirect:/updatee/"+mmm.getMemberId()+"";
			}else if(mmm.getPassword().equals("@8M75K")) {
				return "redirect:/updatepasswd/"+mmm.getMemberId()+"";
			}
			else {
				processCookies(lb, request, response);
			return "redirect:/";
			}			
		}
	}
	
	private void processCookies(LoginBean bean, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String userId = bean.getUserId();
		String password = bean.getPassword();
		Boolean rm = bean.isRememberMe();

		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
		if (rm) {
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
			cookieUser.setPath(request.getContextPath());

			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else { // 使用者沒有對 RememberMe 打勾
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(request.getContextPath());

			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
	}
	
	@RequestMapping("Loginout")
	public String getLogOut(SessionStatus status) {
		System.out.println("執行session,setComplete();");
		System.out.println("已登出");
		status.setComplete();
		return "redirect:/";
	}
	
//	public void Gmailsend(String email) {
//		System.out.println("email");
//		System.out.println(email);
//		String host = "smtp.gmail.com";
//		int port = 587;
//		String username = "lintest546@gmail.com";
//		String password = "0928103546";// your password
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.port", port);
//		Session session = Session.getInstance(props, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		});
//		String div = "忘記密碼， 您的密碼已預設成，"+"<h2 style='color:red'>"+"@8M75K"+"</h2>"+"，請登入後修改密碼";
//		try {
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress("lintest546@gmail.com"));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
//			message.setSubject("忘記密碼.");
//			message.setContent(div,"text/html;charset=UTF-8");
//
//			Transport transport = session.getTransport("smtp");
//			transport.connect(host, port, username, password);
//			Transport.send(message);
//			System.out.println("HIHIHI");
//		} catch (MessagingException e) {
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
//	}
//	
//	@GetMapping("/forgetpwd")
//	public String forgetpwd(Model model, HttpServletRequest request) {
//		ForgetBean mb1 = new ForgetBean();
//		model.addAttribute("forgot", mb1);
//		return "MB/forget";
//	}
//
//	@PostMapping("/forgetpwd")
//	public String forgotpwds(@ModelAttribute("forgot") ForgetBean mb, Model model, BindingResult result,
//			HttpServletRequest request, HttpServletResponse response) {
//		List<String> list = service.seachMemberaccount();
//		ForgetPassword validator = new ForgetPassword();
//		validator.validate(mb, result);
//
//		if (list.contains(mb.getMemberEmail())) {
//			System.out.println("有");
//			try {
//				Gmailsend(mb.getMemberEmail());
//			} catch (Exception e) {
//				e.printStackTrace();
//				return "MB/error";
//			}
//			
//			service.updatePassword(mb.getMemberEmail());
//			return "redirect:/Login";
//		} else {
//			result.rejectValue("invalidCredentials", "", "該帳號不存在");
//			return "MB/forget";
//		}
//	}
}