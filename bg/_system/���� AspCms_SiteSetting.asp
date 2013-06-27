<!--#include file="AspCms_SettingFun.asp" -->
<%CheckAdmin("AspCms_SiteSetting.asp")%>
<%getComplanySetting%>
<%
'在新变量第一次使用时，若不开启忽略则会报错
on error resume next
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.tinyTips.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$('a.tTip').tinyTips('title');
			$('a.imgTip').tinyTips('title');
			$('img.tTip').tinyTips('title');
			$('h1.tagline').tinyTips('tinyTips are totally awesome!');
		});
		</script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/tinyTips.css" />
<script type="text/javascript">
        function SetGoogleMapGode(t){
var s = "<";
s += "script src='http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=";
s += "{aspcms:googlemapkey}' type='text/javascript'>";
s += "</";
s += "script>";
s += "\n";
s += "<";
s += "script src='http://www.google.com/uds/api?file=uds.js&amp;v=1.0' type='text/javascript'>";
s += "</";
s += "script>";
s += "\n";
s += "<";
s += "script src='http://www.google.com/uds/solutions/localsearch/gmlocalsearch.js' type='text/javascript'>";
s += "</";
s += "script>";
s += "\n";
	document.getElementById(t).innerText = s;
	document.getElementById(t).style.display = "block";
		}
        </script></HEAD>
<BODY>
<DIV class=formzone>
<FORM name="" action="?action=saves" method="post">
<DIV class=tablezone>

<TABLE cellSpacing=0 cellPadding=8 width="100%" align=center border=0>
<TBODY>
    <TR>
    <TD width="193" class=innerbiaoti><STRONG>网站参数</STRONG></TD>
        <TD class=innerbiaoti width=568 height=28></TD>
    </TR>
    <TR class=list>
        <TD>网站运行模式 : </TD>
        <TD width=568>
        <input type="radio" name="runMode" value="0" <% if runMode=0 then echo"checked" end if %>>动态
        <input type="radio" name="runMode" value="1" <% if runMode=1 then echo"checked" end if %>>静态   <img src="../images/help.gif" class="tTip" title="如果选择静态模式，请在更新信息后在静态管理中生成所编辑的信息"></TD>
    </TR>
    <TR class=list>
        <TD>网站状态 : </TD>
        <TD width=568>
        <input type="radio" name="siteMode" value="1" <% if siteMode=1 then echo"checked" end if %>>运行
        <input type="radio" name="siteMode" value="0" <% if siteMode=0 then echo"checked" end if %>>关闭        </TD>
    </TR>
    <TR class=list>
        <TD>网站关闭说明 : </TD>
        <TD><INPUT class="input" size="30" style="width:80%" value="<%=siteHelp%>" name="siteHelp"/> </TD>
    </TR>
    <TR class=list>
        <TD>评论功能开关 : </TD>
        <TD>
        	<input type="radio" value="1" name="SwitchComments" <% if SwitchComments=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="SwitchComments" <% if SwitchComments=0 then echo "checked" end if%>>关闭 <img src="../images/help.gif" class="tTip" title="评论开关以及评论审核开关需要在页面中调用相应的评论标签才有作用">
        </TD>
    </TR>
    <TR class=list>
        <TD>评论审核开关 : </TD>
        <TD><input type="radio" value="1" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=0 then echo "checked" end if%>>关闭</TD>
    </TR>
    <TR class=list>
        <TD>留言功能开关 : </TD>
        <TD>
            <input type="radio" value="1" name="switchFaq" <% if switchFaq=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="switchFaq" <% if switchFaq=0 then echo "checked" end if%>>关闭
         </TD>
    </TR> <TR class=list>
        <TD>留言审核开关 : </TD>
        <TD>
            <input type="radio" value="1" name="SwitchFaqStatus" <% if SwitchFaqStatus=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="SwitchFaqStatus" <% if SwitchFaqStatus=0 then echo "checked" end if%>>关闭  <img src="../images/help.gif" class="tTip" title="留言开关以及留言审核开关需要在页面中调用相应的留言标签才有作用">
         </TD>
    </TR>
    <TR class=list>
        <TD>过滤设置开关 : </TD>
        <TD><input type="radio" value="1" name="dirtyStrToggle" <% if dirtyStrToggle=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="dirtyStrToggle" <% if dirtyStrToggle=0 then echo "checked" end if%>>关闭 <img src="../images/help.gif" class="tTip" title="网站中过滤掉非法字符，请在过滤设置中设置需要过滤的字符"></TD>
    </TR>
    <TR class=list>
        <TD>过滤设置 : </TD>
        <TD><textarea class="textarea" name="dirtyStr" cols="60" style="width:98%" rows="8"><%=decode(dirtyStr)%></textarea></TD>
    </TR>
    <TR>
    	<TD class=innerbiaoti><STRONG>电子地图</STRONG></TD>
        <TD class=innerbiaoti></TD>
    </TR>  
    <TR class=list>
        <TD>Google地图 : </TD>
        <TD>
        <span title="没有申请是不能在线查看的">API 密钥</span>:<br><INPUT class="input" size="30" style="width:80%" value="<%SafeEcho("GoogleAPIKey")%>" name="GoogleAPIKey"/><a target="_blank" href="http://code.google.com/intl/zh-CN/apis/maps/signup.html">在线申请</a><br>
        Google地图坐标:<br><INPUT class="input" id="GoogleMapLat" readonly size="30" style="width:40%" value="<%SafeEcho("GoogleMapLat")%>" name="GoogleMapLat"/><INPUT class="input" id="GoogleMapLng" readonly size="30" style="width:40%" value="<%SafeEcho("GoogleMapLng")%>" name="GoogleMapLng"/><a href='javascript:void(0)' onClick="var r = window.showModalDialog('GoogleMap.html',null,'dialogWidth=600px;dialogHeight=600px');if(r!=null){document.getElementById('GoogleMapLat').value = r.lat;document.getElementById('GoogleMapLng').value = r.lng;}">获取坐标</a>
        <br />
        
        <input type="button" value="生成调用代码" onclick='SetGoogleMapGode("googlemapcode")' />
        <textarea id="googlemapcode" style="display:none;width:100%"></textarea>
        </TD>
    </TR>
    <TR>
    	<TD class=innerbiaoti><STRONG>水印设置</STRONG></TD>
        <TD class=innerbiaoti></TD>
    </TR>   
    <TR class=list>
        <TD>是否开启水印功能 : </TD>
        <TD>
        <input type="radio" name="waterMark" value="1" <% if waterMark=1 then echo"checked" end if %>>开启
        <input type="radio" name="waterMark" value="0" <% if waterMark=0 then echo"checked" end if %>>关闭 <img src="../images/help.gif" class="tTip" title="水印功能需要相关组件的支持，只能对图片进行加水印"></TD>
    </TR>
<!--    <TR class=list>
        <TD>水印类型 : </TD>
        <TD>
        <input type="radio" name="waterType" value="0" <% if waterType=0 then echo"checked" end if %>>文字
        <input type="radio" name="waterType" value="1" <% if waterType=1 then echo"checked" end if %>>图片        </TD>
    </TR> -->
    <TR class=list>
        <TD>水印文字 : </TD>
        <TD><input class="input" size="30" value="<%=waterMarkFont%>" name="waterMarkFont"/></TD>
    </TR>
    <TR class=list>
        <TD>水印位置 : </TD>
        <TD>
          <table width="300" border="0" cellspacing="1" cellpadding="0">
            <tr>
                <td width="33%"><input type="radio" name="waterMarkLocation"  value="1" <% if waterMarkLocation=1 then echo"checked" end if %>>顶部居左</td>
                <td width="33%"><input type="radio" name="waterMarkLocation"  value="2" <% if waterMarkLocation=2 then echo"checked" end if %>>顶部居中</td>
                <td><input type="radio" name="waterMarkLocation"  value="3" <% if waterMarkLocation=3 then echo"checked" end if %>>顶部居右</td>
            </tr>
            <tr>
                <td><input type="radio" name="waterMarkLocation"  value="4" <% if waterMarkLocation=4 then echo"checked" end if %>>左边居中</td>
                <td><input type="radio" name="waterMarkLocation"  value="5" <% if waterMarkLocation=5 then echo"checked" end if %>>图片中心</td>
                <td><input type="radio" name="waterMarkLocation"  value="6" <% if waterMarkLocation=6 then echo"checked" end if %>>右边居中</td>
            </tr>
            <tr>
                <td><input type="radio" name="waterMarkLocation"  value="7" <% if waterMarkLocation=7 then echo"checked" end if %>>底部居左</td>
                <td><input type="radio" name="waterMarkLocation"  value="8" <% if waterMarkLocation=8 then echo"checked" end if %>>底部居中</td>
                <td><input name="waterMarkLocation" type="radio"  value="9" <% if waterMarkLocation=9 then echo"checked" end if %>>底部居右</td>
            </tr>
         </table>
      </TD>
    </TR>
    <TR>
    	<TD class=innerbiaoti><STRONG>邮件设置</STRONG></TD>
        <TD class=innerbiaoti></TD>
    </TR>   
    <TR class=list>
        <TD>邮件地址 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_usermail%>" name="smtp_usermail"/> </TD>
    </TR>
    <TR class=list>
        <TD>邮件账号 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_user%>" name="smtp_user"/> </TD>
    </TR>
    <TR class=list>
        <TD>邮件密码 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_password%>" name="smtp_password"/> </TD>
    </TR>
    <TR class=list>
        <TD>邮件服务器 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_server%>" name="smtp_server"/> </TD>
    </TR>
    <TR>
    	<TD class=innerbiaoti><STRONG>提醒功能</STRONG></TD>
        <TD class=innerbiaoti></TD>
    </TR>   
    <TR class=list>
        <TD>邮件地址 : </TD>
        <TD><INPUT class="input" size="30" value="<%=MessageAlertsEmail%>" name="MessageAlertsEmail"/> </TD>
    </TR>
    <TR class=list>
        <TD>留言提醒 : </TD>
        <TD>
        <input type="radio" name="messageReminded" value="1" <% if messageReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="messageReminded" value="0" <% if messageReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    <TR class=list>
        <TD>订单提醒 : </TD>
        <TD>
        <input type="radio" name="orderReminded" value="1" <% if orderReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="orderReminded" value="0" <% if orderReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    <TR class=list>
        <TD>应聘提醒 : </TD>
        <TD>
        <input type="radio" name="applyReminded" value="1" <% if applyReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="applyReminded" value="0" <% if applyReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    <TR class=list>
        <TD>评论提醒 : </TD>
        <TD>
        <input type="radio" name="commentReminded" value="1" <% if commentReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="commentReminded" value="0" <% if commentReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    
</TBODY></TABLE>
</DIV>
<DIV class=adminsubmit>
<INPUT type="hidden" value="<%=LanguageID%>" name="LanguageID" />
<INPUT class="button" type="submit" value="保存" />
<INPUT class="button" type="button" value="返回" onClick="history.go(-1)"/> 
 </DIV></FORM>
</DIV>
</BODY>
</HTML>
