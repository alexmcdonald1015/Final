function final()

    
    global table;
    
    %GUI title
    table.fig = figure('numbertitle','off','name','Coordinate Plotting Tabe'); 
    table.p = plot(0,0);
    table.p.Parent.Position = [.48 .3 .5 .5];
    %x,y edit boxed
    table.xEdit = uicontrol('style','edit','units','normalized','position',[.15 .78 .09 .05],'string','','horizontalalignment','right');
    table.yEdit = uicontrol('style','edit','units','normalized','position',[.15 .72 .09 .05],'string','','horizontalalignment','right');
    table.xDispMessg = uicontrol('style','text','units','normalized','position', [.05 .78 .09 .05],'string','X Value:','horizontalalignment','right');
    table.yDispMessg = uicontrol('style','text','units','normalized','position', [.05 .72 .09 .05],'string','Y Value:','horizontalalignment','right');
    
    %x,y lim edit boxes
    table.xLimLow = uicontrol('style','edit','units','normalized','position',[.15 .66 .09 .05],'string','','horizontalalignment','right');
    table.yLimLow = uicontrol('style','edit','units','normalized','position',[.15 .60 .09 .05],'string','','horizontalalignment','right');
    
    table.xLimHi = uicontrol('style','edit','units','normalized','position',[.34 .66 .09 .05],'string','','horizontalalignment','right');
    table.yLimHi = uicontrol('style','edit','units','normalized','position',[.34 .60 .09 .05],'string','','horizontalalignment','right');
    
    table.xLimDispMessg = uicontrol('style','text','units','normalized','position', [.05 .66 .09 .05],'string','X Axis Limits:','horizontalalignment','right');
    table.yLimDispMessg = uicontrol('style','text','units','normalized','position', [.05 .60 .09 .05],'string','Y Axis Limits:','horizontalalignment','right');
    
    table.xLimTo = uicontrol('style','text','units','normalized','position', [.27 .66 .05 .05],'string','to','horizontalalignment','Left');
    table.yLimTo = uicontrol('style','text','units','normalized','position', [.27 .60 .05 .05],'string','to','horizontalalignment','Left');
    
    %Plot axis titles
    table.xAxis = uicontrol('style','edit','units','normalized','position',[.15 .54 .28 .05],'string','','horizontalalignment','right');
    table.yAxis = uicontrol('style','edit','units','normalized','position',[.15 .48 .28 .05],'string','','horizontalalignment','right');
    
    table.xAxisDispMessg = uicontrol('style','text','units','normalized','position', [.05 .54 .09 .05],'string','X Axis Label:','horizontalalignment','right');
    table.yAxisDispMessg = uicontrol('style','text','units','normalized','position', [.05 .48 .09 .05],'string','Y Axis Label:','horizontalalignment','right');
    
    %Plot title
    table.plotTitle = uicontrol('style','edit','units','normalized','position',[.15 .42 .28 .05],'string','','horizontalalignment','right');
    table.plotTitleDispMessg = uicontrol('style','text','units','normalized','position', [.05 .42 .09 .05],'string','Plot Title:','horizontalalignment','right');
    
    %line style
    table.buttonGroup1 = uibuttongroup('visible','on','units','normalized','position',[.25 .15 .15 .25],'selectionchangedfcn',{@styleSwitch});
    
    table.star = uicontrol(table.buttonGroup1,'style','radio','units','normalized','position',[.1 .8 1 .2],'HandleVisibility','off','string','Stars','horizontalalignment','right');
    table.circle = uicontrol(table.buttonGroup1,'style','radio','units','normalized','position',[.1 .5 1 .2],'HandleVisibility','off','string','Circles','horizontalalignment','right');
    table.xx = uicontrol(table.buttonGroup1,'style','radio','units','normalized','position',[.1 .2 1 .2],'HandleVisibility','off','string','Xs','horizontalalignment','right');
    
    %line color
    table.buttonGroup = uibuttongroup('visible','on','units','normalized','position',[.05 .15 .15 .25],'selectionchangedfcn',{@colorSwitch});
    
    table.blue = uicontrol(table.buttonGroup,'style','radio','units','normalized','position',[.1 .8 1 .2],'HandleVisibility','off','string','Blue','horizontalalignment','right');
    table.red = uicontrol(table.buttonGroup,'style','radio','units','normalized','position',[.1 .5 1 .2],'HandleVisibility','off','string','Red','horizontalalignment','right');
    table.green = uicontrol(table.buttonGroup,'style','radio','units','normalized','position',[.1 .2 1 .2],'HandleVisibility','off','string','Green','horizontalalignment','right');
    
    %plot button
    table.plotButton = uicontrol('style','pushbutton','units','normalized','position',[.2 .007 .14 .05],'string','plot','callback',{@plotFxn});

    
%the color and style switch functions change the selected objects to a set
%variable to be compared in the plotFxn
 function [] = colorSwitch(~,~)
     shade = table.buttonGroup.SelectedObject.String;
     plotFxn(shade);
 end

 function [] = styleSwitch(~,~)
     style = table.buttonGroup1.SelectedObject.String;
     plotFxn(style);
 end

    function [] = plotFxn(source,event)
        x = str2num(table.xEdit.String);    %The x and y variables are declared by changing from strings to numbers
        y = str2num(table.yEdit.String);
        shade = table.buttonGroup.SelectedObject.String;
        style = table.buttonGroup1.SelectedObject.String;
        if length(x) > length(y)
            msgbox('Missing Y value','Input Error','error','modal');    %error messages if missing an x or y variable
        elseif length(y) > length(x)
            msgbox('Missing X value','Input Error','error','modal');
        else
            
            if strcmp(shade,'Blue')             %the outer three if statements identify which color is selected
                if strcmp(style,'Stars')
                    table.p = plot(x, y, '*b'); %the three inner if statements on each of those mentioned above identify the style selected.
                elseif strcmp(style,'Circles')
                    table.p = plot(x, y, 'ob');
                else
                    table.p = plot(x, y, 'xb');
                end
            elseif strcmp(shade,'Red')
                if strcmp(style,'Stars')
                    table.p = plot(x, y, '*r');
                elseif strcmp(style,'Circles')
                    table.p = plot(x, y, 'or');
                else
                    table.p = plot(x, y, 'xr');
                end  
            else
                if strcmp(style,'Stars')
                    table.p = plot(x, y, '*g');
                elseif strcmp(style,'Circles')
                    table.p = plot(x, y, 'og');
                else
                    table.p = plot(x, y, 'xg');
                end
                
            end
            

        xlabel(table.xAxis.String)  %labels the axis and titles from the GUI edit boxes
        ylabel(table.yAxis.String)
        title(table.plotTitle.String)
        
        xLo = str2num(table.xLimLow.String);    %declares the four variables necessary for the x and y limits on the graph
        yLo = str2num(table.yLimLow.String);
        
        xHi = str2num(table.xLimHi.String);
        yHi = str2num(table.yLimHi.String);
        
            if isempty(xLo) && isempty(xHi)
                %left empty because no title or error is needed
            elseif ~isempty(xLo) && isempty(xHi)
                msgbox('Missing X value','Limit Error','error','modal');    %error messages if one of the values is blank
            elseif isempty(xLo) && ~isempty(xHi)
                msgbox('Missing X value','Limit Error','error','modal');
            elseif xLo >= xHi
                msgbox('The low X value is greater than or equal to the high X value.','Limit Error','error','modal'); %error message if the limits are equal or backwards
            else
            xlim([xLo xHi]);    %adjusts to the correct limit
            end
            
            if isempty(yLo) && isempty(yHi)
                 %left empty because no title or error is needed
            elseif ~isempty(yLo) && isempty(yHi)
                msgbox('Missing Y value','Limit Error','error','modal');  %error messages if one of the values is blank
            elseif isempty(yLo) && ~isempty(yHi)
                msgbox('Missing Y value','Limit Error','error','modal');
            elseif yLo >= yHi
                msgbox('The low Y value is greater than or equal to the high Y value.','Limit Error','error','modal'); %error message if the limits are equal or backwards
            else
            ylim([yLo yHi]);
            end
            
        end
        
    end

end