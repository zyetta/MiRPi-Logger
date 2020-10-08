function FIG = singlePlot(A, LGD, YLAB, TTL , TYP, YLIM, TCK);
    FIG = nexttile;
    hold on
    if(A(1, 2) > -1)
        X = unix2dt(A(:, 1));
        Y = A(:, 2);
        if(TYP == 1)
            x = stairs(X, Y);
        elseif(TYP == 2)
            x = step(X, Y);
        else
            x = plot(X, Y);
        end
    title(TTL);
    ylabel(YLAB);
    ylim(YLIM);
    grid on
    
    if(TCK == 1)
        set(gca,'xticklabel',[]);
        
        
    end
end
