<%
Const runMode=0	'��վ����ģʽ��0Ϊ��̬��1Ϊ��̬��
Const sitePath=""	'��վ��Ŀ¼ ����:/cms
Const accessFilePath="data/data.asp"	'access���ݿ��ļ�·��
Const dbType=0  '���ݿ����ͣ�0Ϊaccess��1Ϊsqlserver��
Const databaseServer="."  'sqlserver���ݿ��ַ
Const databaseName="aspcms"  'sqlserver���ݿ�����
Const databaseUser="sa"  'sqlserver���ݿ��˺�
Const databasepwd="sa"  'sqlserver���ݿ�����
Const fileExt=".html"	'�����ļ���չ����htm,html,asp��	
Const upLoadPath="upLoad"	'�ϴ��ļ�Ŀ¼
Const textFilter=""	'���ֹ���
Const tablePrefix="AspCms_"	'���ݿ�ǰ׺
Const upFileSize=20000	'�ϴ��ļ���С����KB
Const upFileWay=1	'�ϴ��ļ���ʽ����(1,������ϴ�,)
Const htmlDir="aspcms"	'�ĵ�HTMLĬ�ϱ���·��

'������
Const siteMode=1	'��վ״̬��0Ϊ�رգ�1Ϊ���У�
Const siteHelp="����վ����������ر���"	'��վ״̬��0Ϊ�رգ�1Ϊ���У�
Const switchFaq=0	'���Կ��أ�0Ϊ�رգ�1Ϊ������
Const switchFaqStatus=0 '������˿��أ�0Ϊ�����ã�1Ϊ���ã�
Const switchComments=0	'���ۿ��أ�0Ϊ�رգ�1Ϊ������
Const switchCommentsStatus=0	'��������Ƿ����ã�0Ϊ�����ã�1Ϊ���ã�


Const waterMark=0	'ˮӡ(0,1)
Const waterType=0	'ˮӡ����(0Ϊ���֣�1ͼƬ)
Const waterMarkFont="ˮӡʾ��"	'ˮӡ����
Const waterMarkPic="/images/logo.png"	'ˮӡͼƬ
Const waterMarkLocation="1"	'λ��

'�ʼ����� 
Const smtp_usermail=""	'�ʼ���ַ
Const smtp_user=""	'�ʼ��˺� 
Const smtp_password=""	'�ʼ����� 
Const smtp_server=""	'�ʼ�������

'���ѹ���
Const messageAlertsEmail=""	'�ʼ���ַ
Const messageReminded=1	'��������
Const orderReminded=0	'��������
Const commentReminded=1	'��������
Const applyReminded=0	'ӦƸ����

Const sortTypes="��ƪ,����,��Ʒ,����,��Ƹ,���,����"

 
Const dirtyStr="����<br>taiwan<br>���"

'���߿ͷ�
Const serviceStatus=1	'���߿ͷ���ʾ״̬
Const serviceStyle=2	'��ʽ
Const serviceLocation="left"	'��ʾλ��
Const serviceQQ="������ѯ1|1364898282 ������ѯ2|245831330" 'QQ
'Const serviceEmail="234324324"	'����
'Const servicePhone="43244324324"	'�绰
Const serviceWangWang=""	'����
Const serviceContact=""	'��ϵ��ʽ����
Const servicekfStatus=1	
Const servicekf=""	'

'53�ͷ�
Const service53kfStatus=0	'53KF��ʾ״̬
Const service53kf=0	'53KF����״̬
Const service53kfaccount="" '53KF�ʺ�
Const service53workid="" '53KF����
Const service53kfpasswd="" '53KF����


'�õ�Ƭ����
Const slidestyle=0	'�õ�Ƭ��ʽ
Const slideImgs="/upLoad/slide/month_1202/201202191445128383.jpg, /upLoad/slide/month_1202/201202200543082455.jpg, /upLoad/slide/month_1202/201202191530064096.jpg, /upLoad/slide/month_1202/201202191533492833.jpg, /upLoad/slide/month_1202/201202200544524883.jpg,,,"	'ͼƬ��ַ
Const slideLinks=", , , , ,,,"	'���ӵ�ַ
Const slideTexts="2011��������ݮС������佱����, 2011��������ݮС������ֳ�����, 2011��������ݮС������ֳ�����, 2011�����������ڴ��˰������㻨��, ,,,"	'����˵��
Const slideWidth="1002"	'��
Const slideHeight="244"	'��
Const slideTextStatus=1	'����˵������
Const slideNum=7	'����˵������


Const GoogleAPIKey="ABQIAAAAsVu1a2Gd374OJVBz5A7LSxQKG8KDqdzejQUisn9kEvLnCjgoXxQXWBVxIqBzrZjD0pbgvbveRVERqw"
Const GoogleMapLat=30.593086
Const GoogleMapLng=114.30536



Const dirtyStrToggle=1

%>