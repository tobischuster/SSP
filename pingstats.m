function out=pingstats(machine,num,verbose)

% function out=pingstats(machine,num,verbose)
%
% Example : stats=pingstats('dsl.stanford.edu',100,'v')
%           or www.google.com
%   
%   machine : name or IP address of the computer to be "pinged"
%   num     : number of ping operations
%   verbose : if different from '' (empty string) the ping state gets displayed
%
%  For Homework 1 of TdS2.
%  Executes pings to computer "machine" "num" times.
%  Lost packets are ignored (as if no ping was launched).
%  The vector "out" contains the ping times in milliseconds.
%  L.D.

i=1;

str1='ping -s ';
str2=machine;
str3=' 64 1 | awk  -vOFS='';'' /time/''{s=substr($7,6); print s}''';
str=[str1 str2 str3]
[s,w]=unix(str)

ww=str2num(w);
format compact;

while i<=num
    i
    ww
    isempty(ww)
   if ~(isempty(ww))
       out(i)=ww;
       if ~(isempty(verbose))
             disp(i);
       end
       i=i+1;
   end;
  [s,w]=unix(str);
  ww=str2num(w);
end
format; 