function gray = nrgb2gray(rgb,varargin)

%{
    Features: Converte RGB to Gray.

    Input: RGB    -- M*3 or 3*M or M*N*3
           method -- The method must be one of ['rec601', 'itu709', 'itu2100', 'mean', 'light'].
           
    Output: RGB(m*3).
    

    Author(作者): 巴山(bashan)
    WeChat Official Account(微信公众号): 懂科学的程序员(ScientificProgrammer)
    Github: https://github.com/ScientificProgrammerOwner
    Youtube: https://www.youtube.com/channel/UC4U9cwe6FxRKec_0s5z0Wkw
    ZhiHu(知乎): https://www.zhihu.com/people/67-93-61-26-8
    BiliBili(B站): https://space.bilibili.com/205153905

    Welcome to subscribe! 欢迎订阅！
%}
gray = [];
narginchk(1,2);

switch(nargin)
    case 1
        method = 'rec601';
    case 2
        method = varargin{1};
        if ~ischar(method)
            method = 'rec601';
        end
end
switch(ndims(rgb))
    case 2
        try
            validateattributes(rgb,{'numeric'},{'size',[NaN,3],'>=',0,'<=',255,'nonnan'});
        catch
            validateattributes(rgb,{'numeric'},{'size',[3,NaN],'>=',0,'<=',255,'nonnan'});
            rgb = rgb';
        end
        if max(rgb(:)) <= 1
            rgb = rgb*255;
        end
        switch(method)
            case 'rec601'
                % Rec.ITU-R BT.601-7：
                gray = 0.299*rgb(:,1) + 0.587*rgb(:,2) + 0.114*rgb(:,3);
            case 'itu709'
                % ITU-R BT.709
                gray = 0.2126*rgb(:,1) + 0.7152*rgb(:,2) + 0.0722*rgb(:,3);
            case 'itu2100'
                % ITU-R BT.2100
                gray = 0.2627*rgb(:,1) + 0.6780*rgb(:,2) + 0.0593*rgb(:,3);
            case 'mean'
                gray = mean(rgb,2);
            case 'light'
                gray = (max(rgb,[],2)+min(rgb,[],2))/2;
            otherwise
                errordlg('The method must one of [''rec601'', ''itu709'', ''itu2100'', ''mean'', ''light'']!');
        end
    case 3
        validateattributes(rgb,{'numeric'},{'size',[NaN,NaN,3],'>=',0,'<=',255,'nonnan'});
        if max(rgb(:)) <= 1
            rgb = rgb*255;
        end
        switch(method)
            case 'rec601'
                % Rec.ITU-R BT.601-7：
                gray = 0.299*rgb(:,:,1) + 0.587*rgb(:,:,2) + 0.114*rgb(:,:,3);
            case 'itu709'
                % ITU-R BT.709
                gray = 0.2126*rgb(:,:,1) + 0.7152*rgb(:,:,2) + 0.0722*rgb(:,:,3);
            case 'itu2100'
                % ITU-R BT.2100
                gray = 0.2627*rgb(:,:,1) + 0.6780*rgb(:,:,2) + 0.0593*rgb(:,:,3);
            case 'mean'
                gray = mean(rgb,3);
            case 'light'
                gray = (max(rgb,[],3)+min(rgb,[],3))/2;
            otherwise
                errordlg('The method must one of [''rec601'', ''itu709'', ''itu2100'', ''mean'', ''light'']!');
        end
    otherwise
        errordlg('The dimension of rgb must be 2 or 3!');
end
end