<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");
%>
       <div id="sub" class="event"">
           <div><img src="../img/sub_top_tit4.png" alt="EVENT"></div>
           <section>
               <aside>
                   <img src="../img/sub_aside_cate4_tit.png" alt="이벤트" />
                   <ul>
                       <li class="on"><a href="./list.jsp?group=event&cate=event">이벤트</a></li>
                   </ul>
               </aside>
               <article>
                   <nav><img src="../img/sub_nav_tit_cate4_tit_<%= cate %>.png" alt="이벤트">
                   <p>
                       HOME > 이벤트 > 
                       <% if(cate.equals("event")){ %>
                       <span>이벤트</span>
                       <% } %>
                   </p>
                   </nav>
                   <div class="content">
                       <!-- 컨텐츠 내용 시작 -->