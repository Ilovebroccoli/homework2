function dada = count(n,g)
article=fileread(n); %读入全文
switch(g)
  case{'c'}     %统计字符数
      c=length(article);
      c
  case{'z'}     %统计字母数
      b=article(find(isletter(article)==1));%  找出字母
      z=length(b);
      z
  case{'w'}    %统计单词数
      article=regexprep(article,'\W',' '); %不是字符的，都转换为空格。除标点符号
      w=sum(isspace(article)); 
      w  
  case{'s'}    %统计句子
      article=regexprep(article,'\.','1 ');
      s=sum(isstrprop(article,'digit'))    %统计句子数
      s     
   case{'d'}  % 统计代码行数
      code = fopen(n, 'r');  %  读出文件   r 读出  
           d = 0;
            while ~feof(code)      %   未读到文件末尾，一直循环下去
                t = fgetl(code);     %   从文件中读取一行数据，并去掉行末的换行符   
                for i = 1:numel(t)   %  numel 返回数量
                    if t(i) ~= ' '      %  确认不是 空格行
                        break; 
                    end
                end
                if numel(t) && i < numel(t) && t(i) ~= '%'  %确认不是 注释行
                    d = d + 1;
                end
            end
            d
     case{'p'}    % 统计空格行数
            code = fopen(n, 'r');  %  读出文件   r 读出  
            d = 0;
            m=0;
            n=0;
            while ~feof(code)      %   未读到文件末尾，一直循环下去
                t = fgetl(code);     %   从文件中读取一行数据，并去掉行末的换行符   
                for i = 1:numel(t)   %  numel 返回数量
                    if t(i) ~= ' '      %  确认不是 空格行
                         m=m+1;  %  除了空行的行数
                        break; 
                    end
                end
                if numel(t) && i < numel(t) && t(i) ~= '%'  %确认不是 注释行
                    d = d + 1;
                else
                    n=n+1;     %  注释行加空行
                end
            end
             p=n-m+d  % 空行数
             
    case{'h'}    % 统计注释行数
            code = fopen(n, 'r');  %  读出文件   r 读出  
            d = 0;
            m=0;
            n=0;
            while ~feof(code)      %   未读到文件末尾，一直循环下去
                t = fgetl(code);     %   从文件中读取一行数据，并去掉行末的换行符   
                for i = 1:numel(t)   %  numel 返回数量
                    if t(i) ~= ' '      %  确认不是 空格行
                         m=m+1;  %  除了空行的行数
                        break; 
                    end
                end
                if numel(t) && i < numel(t) && t(i) ~= '%'  %确认不是 注释行
                    d = d + 1;
                else
                    n=n+1;     %  注释行加空行
                end
            end
            h=m-d   %  注释行                   
end

end

