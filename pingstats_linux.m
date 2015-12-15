function out=pingstats_linux(machine,num,verbose)

% function out=pingstats(machine,num,verbose)
%
% Example : stats=pingstats('dsl.stanford.edu',100,'v')
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

str1='ping ';
str2=machine;
str3=' -c 1 -s 64 -i 1 | awk -vOFS='';'' /time/'' { s=substr($8,6,7) ; print s }'' ';

str=[str1 str2 str3];

format compact;

while i<=num
    [s,w]=unix(str);
    ww=str2num(w);
    if ~(isempty(ww))
        out(i)=ww;
        if ~(isempty(verbose))
            disp(i);
        end;
        i=i+1;
    end;
end;

format; 