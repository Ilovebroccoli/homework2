function dada = count(n,g)
article=fileread(n); %����ȫ��
switch(g)
  case{'c'}     %ͳ���ַ���
      c=length(article);
      c
  case{'z'}     %ͳ����ĸ��
      b=article(find(isletter(article)==1));%  �ҳ���ĸ
      z=length(b);
      z
  case{'w'}    %ͳ�Ƶ�����
      article=regexprep(article,'\W',' '); %�����ַ��ģ���ת��Ϊ�ո񡣳�������
      w=sum(isspace(article)); 
      w  
  case{'s'}    %ͳ�ƾ���
      article=regexprep(article,'\.','1 ');
      s=sum(isstrprop(article,'digit'))    %ͳ�ƾ�����
      s     
   case{'d'}  % ͳ�ƴ�������
      code = fopen(n, 'r');  %  �����ļ�   r ����  
           d = 0;
            while ~feof(code)      %   δ�����ļ�ĩβ��һֱѭ����ȥ
                t = fgetl(code);     %   ���ļ��ж�ȡһ�����ݣ���ȥ����ĩ�Ļ��з�   
                for i = 1:numel(t)   %  numel ��������
                    if t(i) ~= ' '      %  ȷ�ϲ��� �ո���
                        break; 
                    end
                end
                if numel(t) && i < numel(t) && t(i) ~= '%'  %ȷ�ϲ��� ע����
                    d = d + 1;
                end
            end
            d
     case{'p'}    % ͳ�ƿո�����
            code = fopen(n, 'r');  %  �����ļ�   r ����  
            d = 0;
            m=0;
            n=0;
            while ~feof(code)      %   δ�����ļ�ĩβ��һֱѭ����ȥ
                t = fgetl(code);     %   ���ļ��ж�ȡһ�����ݣ���ȥ����ĩ�Ļ��з�   
                for i = 1:numel(t)   %  numel ��������
                    if t(i) ~= ' '      %  ȷ�ϲ��� �ո���
                         m=m+1;  %  ���˿��е�����
                        break; 
                    end
                end
                if numel(t) && i < numel(t) && t(i) ~= '%'  %ȷ�ϲ��� ע����
                    d = d + 1;
                else
                    n=n+1;     %  ע���мӿ���
                end
            end
             p=n-m+d  % ������
             
    case{'h'}    % ͳ��ע������
            code = fopen(n, 'r');  %  �����ļ�   r ����  
            d = 0;
            m=0;
            n=0;
            while ~feof(code)      %   δ�����ļ�ĩβ��һֱѭ����ȥ
                t = fgetl(code);     %   ���ļ��ж�ȡһ�����ݣ���ȥ����ĩ�Ļ��з�   
                for i = 1:numel(t)   %  numel ��������
                    if t(i) ~= ' '      %  ȷ�ϲ��� �ո���
                         m=m+1;  %  ���˿��е�����
                        break; 
                    end
                end
                if numel(t) && i < numel(t) && t(i) ~= '%'  %ȷ�ϲ��� ע����
                    d = d + 1;
                else
                    n=n+1;     %  ע���мӿ���
                end
            end
            h=m-d   %  ע����                   
end

end

