function plotFigures(X, Y, Name, y_lab, ttl, type, pos, y_lim, tic)
    global tiles;
    tiles(pos) = nexttile;
    if(type == 0)
        stem(X, Y, 'lineWidth', 1);
    elseif(type == 1)
        stairs(X, Y,'lineWidth', 1);
    end
    title(ttl);
    grid on
    ylabel(y_lab);
    ylim(y_lim);
    if(tic == 0)
        set(gca,'xtick',[])
        set(gca,'xticklabel',[])
    end
end
