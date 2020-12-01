% Step 2
% Example link: https://www.mathworks.com/help/signal/ug/dct-for-speech-signal-compression.html
clear dct;
load('strong.mat');

% her audio
x = her'; % get the inverse matrix of her
X = dct(x); % get the DCT 

[XX,ind] = sort(abs(X), 'descend');

need = 1;
while norm(X(ind(1:need)))/norm(X)<0.999
    need = need + 1;
end

xpc = need / length(X)*100;

X(ind(need+1:end)) = 0; % zeroing out the coefficients with 0.1% of energy 
xx = idct(X);

figure;
plot([x;xx;x - xx]');
legend('Original', [int2str(xpc) '% of coeffs.'], 'Difference', 'Location', 'best');


% him audio 
y = him';
Y = dct(y);

[YY, ind] = sort(abs(Y),'descend');

need = 1;
while norm(Y(ind(1:need)))/norm(Y)<0.999
    need = need + 1;
end

ypc = need/length(Y)*100;
Y(ind(need+1:end)) = 0;
yy = idct(Y);

figure;
plot([y;yy;y-yy]')
legend('Original',[int2str(ypc) '% of coeffs.'], 'Difference', 'Location', 'best');
