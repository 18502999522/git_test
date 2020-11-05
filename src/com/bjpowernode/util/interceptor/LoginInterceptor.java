package com.bjpowernode.util.interceptor;

import com.bjpowernode.entity.Employee;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName LoginInterceptor
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/13 14:42
 * @version 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //System.out.println("before springmvc's action is not excute.................");

        HttpSession session =  request.getSession();

        //从会话当中获取用户
        Employee user = (Employee) session.getAttribute("LoginEmployee");

        if(user == null){
            //用户当前未登录,送用户去登录页面
            request.getRequestDispatcher("/login").forward(request,response);
            return false;
        }
        //如果用户登录过了则流程继续向下走
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {

        //System.out.println("after springmvc'action excuted。but view is not loaded.................");

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {

       // System.out.println("completed.................");

    }


}
