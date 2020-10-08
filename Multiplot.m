function FIG = Multiplot(A1, A2, A3, A4, A5, A6, A7, A8, LGD, YLAB, TTL , TYP, YLIM, TCK);
    FIG = nexttile;
    hold on
    FLAG = 0;   
    i = 1;
    try
        LGD(i)
        GenPlot(A1, TYP, LGD(i), FIG);
    catch
    end
    i = i + 1;
    try
        LGD(i)
        GenPlot(A2, TYP, LGD(i), FIG);
    catch
    end
    i = i + 1;
    try
        GenPlot(A3, TYP, LGD(i), FIG);
    catch
    end
    i = i + 1;
    try
        GenPlot(A4, TYP, LGD(i), FIG);
    catch
    end
    i = i + 1;
    try
        GenPlot(A5, TYP, LGD(i), FIG);
    catch
    end
    i = i + 1;
    try
        GenPlot(A6, TYP, LGD(i), FIG);
    catch
    end
    i = i + 1;
    try
        GenPlot(A7, TYP, LGD(i), FIG);
    catch
    end
    i = i + 1;
    try
        GenPlot(A8, TYP, LGD(i), FIG);
    catch
    end

    
    ylabel(YLAB)
    title(TTL)
    ylim(YLIM)
    legend('show')
    grid on
    set(gca,'xtick',[])
    if(TCK == 1)
        set(gca,'xticklabel',[])
    end
    hold off
    function GenPlot(A, B, C, D)
        FLAG;      
            if(A(1, 2) > -1)
            X = unix2dt(A(:, 1));
            Y = A(:, 2);
            if(B == 1)
                x = stairs(X, Y, 'DisplayName', "RPi " + string(C));
            elseif(B == 2)
                x = step(X, Y, 'DisplayName', "RPi " + string(C));
            else
                x = plot(X, Y, 'DisplayName', "RPi " + string(C));
            end
        end
        
    end
end
