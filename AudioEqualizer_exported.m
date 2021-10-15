classdef AudioEqualizer_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        Preset4Button                  matlab.ui.control.Button
        Preset3Button                  matlab.ui.control.Button
        Preset2Button                  matlab.ui.control.Button
        Preset1Button                  matlab.ui.control.Button
        SelectAudioFileEditField       matlab.ui.control.EditField
        SelectAudioFileEditFieldLabel  matlab.ui.control.Label
        PlayButton                     matlab.ui.control.Button
        Label                          matlab.ui.control.Label
        GainSlider_10                  matlab.ui.control.Slider
        GainSlider_9                   matlab.ui.control.Slider
        GainSlider_8                   matlab.ui.control.Slider
        GainSlider_7                   matlab.ui.control.Slider
        GainSlider_6                   matlab.ui.control.Slider
        GainSlider_5                   matlab.ui.control.Slider
        GainSlider_4                   matlab.ui.control.Slider
        GainSlider_3                   matlab.ui.control.Slider
        GainSlider_2                   matlab.ui.control.Slider
        GainSlider                     matlab.ui.control.Slider
        GainSliderLabel                matlab.ui.control.Label
        PreampSlider                   matlab.ui.control.Slider
        PreampSliderLabel              matlab.ui.control.Label
        UIAxes                         matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
          gain double = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
          b double
          a double
          file_name string = 'Bach2.wav';
          Fs double = 44100;
          preampgain double = 0;
          f double = [0 43 44 87 88 176 177 354 355 709 710 1419 1420 2839 2840 5679 5680 11359 11360 22000]/(22000);
          
    end
    
    methods (Access = private)
        
        function filterCoeff(app)
             app.b = fir2(512,app.f,app.gain);
        end
        function plotfreq(app)
               [h,w] = freqz(app.b);
               semilogx(app.UIAxes, app.f * 22000,20*log10(app.gain),'--b',w/pi * 22000,20 * log10(abs(h)),'--r');
       end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider
        function GainSliderValueChanged(app, event)
            value = app.GainSlider.Value;
            app.gain(1)=10^(value/20);
            app.gain(2)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_2
        function GainSlider_2ValueChanged(app, event)
            value = app.GainSlider_2.Value;
            app.gain(3)=10^(value/20);
            app.gain(4)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_3
        function GainSlider_3ValueChanged(app, event)
            value = app.GainSlider_3.Value;
            app.gain(5)=10^(value/20);
            app.gain(6)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_4
        function GainSlider_4ValueChanged(app, event)
            value = app.GainSlider_4.Value;
            app.gain(7)=10^(value/20);
            app.gain(8)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_5
        function GainSlider_5ValueChanged(app, event)
            value = app.GainSlider_5.Value;
            app.gain(9)=10^(value/20);
            app.gain(10)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_6
        function GainSlider_6ValueChanged(app, event)
            value = app.GainSlider_6.Value;
            app.gain(11)=10^(value/20);
            app.gain(12)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_7
        function GainSlider_7ValueChanged(app, event)
            value = app.GainSlider_7.Value;
            app.gain(13)=10^(value/20);
            app.gain(14)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_8
        function GainSlider_8ValueChanged(app, event)
            value = app.GainSlider_8.Value;
            app.gain(15)=10^(value/20);
            app.gain(16)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_9
        function GainSlider_9ValueChanged(app, event)
            value = app.GainSlider_9.Value;
            app.gain(17)=10^(value/20);
            app.gain(18)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: GainSlider_10
        function GainSlider_10ValueChanged(app, event)
            value = app.GainSlider_10.Value;
            app.gain(19)=10^(value/20);
            app.gain(20)=10^(value/20);
            app.filterCoeff();
            app.plotfreq();
        end

        % Value changed function: PreampSlider
        function PreampSliderValueChanged(app, event)
            value = app.PreampSlider.Value;
            app.preampgain = value;
            app.plotfreq();
        end

        % Value changed function: SelectAudioFileEditField
        function SelectAudioFileEditFieldValueChanged(app, event)
            value = app.SelectAudioFileEditField.Value;
            app.file_name = value;
        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
           [x,Fsampling]=audioread(app.file_name);
           y=filter(10^(app.preampgain/20)*app.b,1,x);   
           sound(y, Fsampling, 8);
        end

        % Button pushed function: Preset1Button
        function Preset1ButtonPushed(app, event)
            app.gain = [10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20) 1 1 1 1 1 1 10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20)];
            app.GainSlider.Value = 9;
            app.GainSlider_2.Value = 9;
            app.GainSlider_3.Value = 9;
            app.GainSlider_4.Value = 9;
            app.GainSlider_5.Value = 0;
            app.GainSlider_6.Value = 0;
            app.GainSlider_7.Value = 0;
            app.GainSlider_8.Value = -9;
            app.GainSlider_9.Value = -9;
            app.GainSlider_10.Value = -9;
            app.filterCoeff();
            app.plotfreq();
        end

        % Button pushed function: Preset2Button
        function Preset2ButtonPushed(app, event)
            app.gain = [10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20) 10^(-9/20) 1 1 1 1 1 1 10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20) 10^(9/20)];
            app.filterCoeff();
            app.GainSlider.Value = -9;
            app.GainSlider_2.Value = -9;
            app.GainSlider_3.Value = -9;
            app.GainSlider_4.Value = -9;
            app.GainSlider_5.Value = 0;
            app.GainSlider_6.Value = 0;
            app.GainSlider_7.Value = 0;
            app.GainSlider_8.Value = 9;
            app.GainSlider_9.Value = 9;
            app.GainSlider_10.Value = 9;
            app.plotfreq();
        end

        % Button pushed function: Preset3Button
        function Preset3ButtonPushed(app, event)
            app.gain = [10^(-6/20) 10^(-6/20) 10^(-3/20) 10^(-3/20) 1 1 10^(3/20) 10^(3/20) 10^(6/20) 10^(6/20) 10^(6/20) 10^(6/20) 10^(3/20) 10^(3/20) 1 1 10^(-3/20) 10^(-3/20) 10^(-6/20) 10^(-6/20)];
            app.filterCoeff();
            app.GainSlider.Value = -6;
            app.GainSlider_2.Value = -3;
            app.GainSlider_3.Value = 0;
            app.GainSlider_4.Value = 3;
            app.GainSlider_5.Value = 6;
            app.GainSlider_6.Value = 6;
            app.GainSlider_7.Value = 3;
            app.GainSlider_8.Value = 0;
            app.GainSlider_9.Value = -3;
            app.GainSlider_10.Value = -6;
            app.plotfreq();
        end

        % Button pushed function: Preset4Button
        function Preset4ButtonPushed(app, event)
            app.gain = [10^(9/20) 10^(9/20) 10^(6/20) 10^(6/20) 1 1 10^(-3/20) 10^(-3/20) 10^(-6/20) 10^(-6/20) 10^(-6/20) 10^(-6/20) 10^(-3/20) 10^(-3/20) 1 1 10^(6/20) 10^(6/20) 10^(9/20) 10^(9/20)];
            app.filterCoeff();
            app.GainSlider.Value = 9;
            app.GainSlider_2.Value = 6;
            app.GainSlider_3.Value = 0;
            app.GainSlider_4.Value = -3;
            app.GainSlider_5.Value = -6;
            app.GainSlider_6.Value = -6;
            app.GainSlider_7.Value = -3;
            app.GainSlider_8.Value = 0;
            app.GainSlider_9.Value = 6;
            app.GainSlider_10.Value = 9;
            app.plotfreq();
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Filter Frequency Response')
            xlabel(app.UIAxes, 'Frequency(kHz)')
            ylabel(app.UIAxes, 'Gain(dB)')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [22 32 302 200];

            % Create PreampSliderLabel
            app.PreampSliderLabel = uilabel(app.UIFigure);
            app.PreampSliderLabel.HorizontalAlignment = 'right';
            app.PreampSliderLabel.Position = [2 355 48 22];
            app.PreampSliderLabel.Text = 'Preamp';

            % Create PreampSlider
            app.PreampSlider = uislider(app.UIFigure);
            app.PreampSlider.Limits = [-12 12];
            app.PreampSlider.Orientation = 'vertical';
            app.PreampSlider.ValueChangedFcn = createCallbackFcn(app, @PreampSliderValueChanged, true);
            app.PreampSlider.Position = [70 291 3 150];

            % Create GainSliderLabel
            app.GainSliderLabel = uilabel(app.UIFigure);
            app.GainSliderLabel.HorizontalAlignment = 'right';
            app.GainSliderLabel.Position = [110 355 31 22];
            app.GainSliderLabel.Text = 'Gain';

            % Create GainSlider
            app.GainSlider = uislider(app.UIFigure);
            app.GainSlider.Limits = [-12 12];
            app.GainSlider.Orientation = 'vertical';
            app.GainSlider.ValueChangedFcn = createCallbackFcn(app, @GainSliderValueChanged, true);
            app.GainSlider.Position = [160 291 3 150];

            % Create GainSlider_2
            app.GainSlider_2 = uislider(app.UIFigure);
            app.GainSlider_2.Limits = [-12 12];
            app.GainSlider_2.Orientation = 'vertical';
            app.GainSlider_2.ValueChangedFcn = createCallbackFcn(app, @GainSlider_2ValueChanged, true);
            app.GainSlider_2.Position = [207 291 3 150];

            % Create GainSlider_3
            app.GainSlider_3 = uislider(app.UIFigure);
            app.GainSlider_3.Limits = [-12 12];
            app.GainSlider_3.Orientation = 'vertical';
            app.GainSlider_3.ValueChangedFcn = createCallbackFcn(app, @GainSlider_3ValueChanged, true);
            app.GainSlider_3.Position = [250 291 3 150];

            % Create GainSlider_4
            app.GainSlider_4 = uislider(app.UIFigure);
            app.GainSlider_4.Limits = [-12 12];
            app.GainSlider_4.Orientation = 'vertical';
            app.GainSlider_4.ValueChangedFcn = createCallbackFcn(app, @GainSlider_4ValueChanged, true);
            app.GainSlider_4.Position = [297 291 3 150];

            % Create GainSlider_5
            app.GainSlider_5 = uislider(app.UIFigure);
            app.GainSlider_5.Limits = [-12 12];
            app.GainSlider_5.Orientation = 'vertical';
            app.GainSlider_5.ValueChangedFcn = createCallbackFcn(app, @GainSlider_5ValueChanged, true);
            app.GainSlider_5.Position = [343 291 3 150];

            % Create GainSlider_6
            app.GainSlider_6 = uislider(app.UIFigure);
            app.GainSlider_6.Limits = [-12 12];
            app.GainSlider_6.Orientation = 'vertical';
            app.GainSlider_6.ValueChangedFcn = createCallbackFcn(app, @GainSlider_6ValueChanged, true);
            app.GainSlider_6.Position = [395 291 3 150];

            % Create GainSlider_7
            app.GainSlider_7 = uislider(app.UIFigure);
            app.GainSlider_7.Limits = [-12 12];
            app.GainSlider_7.Orientation = 'vertical';
            app.GainSlider_7.ValueChangedFcn = createCallbackFcn(app, @GainSlider_7ValueChanged, true);
            app.GainSlider_7.Position = [444 291 3 150];

            % Create GainSlider_8
            app.GainSlider_8 = uislider(app.UIFigure);
            app.GainSlider_8.Limits = [-12 12];
            app.GainSlider_8.Orientation = 'vertical';
            app.GainSlider_8.ValueChangedFcn = createCallbackFcn(app, @GainSlider_8ValueChanged, true);
            app.GainSlider_8.Position = [494 291 3 150];

            % Create GainSlider_9
            app.GainSlider_9 = uislider(app.UIFigure);
            app.GainSlider_9.Limits = [-12 12];
            app.GainSlider_9.Orientation = 'vertical';
            app.GainSlider_9.ValueChangedFcn = createCallbackFcn(app, @GainSlider_9ValueChanged, true);
            app.GainSlider_9.Position = [537 291 3 150];

            % Create GainSlider_10
            app.GainSlider_10 = uislider(app.UIFigure);
            app.GainSlider_10.Limits = [-12 12];
            app.GainSlider_10.Orientation = 'vertical';
            app.GainSlider_10.ValueChangedFcn = createCallbackFcn(app, @GainSlider_10ValueChanged, true);
            app.GainSlider_10.Position = [584 291 3 150];

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.Position = [161 252 471 22];
            app.Label.Text = '22          63        125        250         500         1000       2000       4000     8000      16000';

            % Create PlayButton
            app.PlayButton = uibutton(app.UIFigure, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Position = [442 144 100 22];
            app.PlayButton.Text = 'Play';

            % Create SelectAudioFileEditFieldLabel
            app.SelectAudioFileEditFieldLabel = uilabel(app.UIFigure);
            app.SelectAudioFileEditFieldLabel.HorizontalAlignment = 'right';
            app.SelectAudioFileEditFieldLabel.Position = [330 178 96 22];
            app.SelectAudioFileEditFieldLabel.Text = 'Select Audio File';

            % Create SelectAudioFileEditField
            app.SelectAudioFileEditField = uieditfield(app.UIFigure, 'text');
            app.SelectAudioFileEditField.ValueChangedFcn = createCallbackFcn(app, @SelectAudioFileEditFieldValueChanged, true);
            app.SelectAudioFileEditField.Position = [441 178 100 22];

            % Create Preset1Button
            app.Preset1Button = uibutton(app.UIFigure, 'push');
            app.Preset1Button.ButtonPushedFcn = createCallbackFcn(app, @Preset1ButtonPushed, true);
            app.Preset1Button.Position = [346 101 100 22];
            app.Preset1Button.Text = 'Preset 1';

            % Create Preset2Button
            app.Preset2Button = uibutton(app.UIFigure, 'push');
            app.Preset2Button.ButtonPushedFcn = createCallbackFcn(app, @Preset2ButtonPushed, true);
            app.Preset2Button.Position = [466 101 100 22];
            app.Preset2Button.Text = 'Preset 2';

            % Create Preset3Button
            app.Preset3Button = uibutton(app.UIFigure, 'push');
            app.Preset3Button.ButtonPushedFcn = createCallbackFcn(app, @Preset3ButtonPushed, true);
            app.Preset3Button.Position = [348 61 100 22];
            app.Preset3Button.Text = 'Preset 3';

            % Create Preset4Button
            app.Preset4Button = uibutton(app.UIFigure, 'push');
            app.Preset4Button.ButtonPushedFcn = createCallbackFcn(app, @Preset4ButtonPushed, true);
            app.Preset4Button.Position = [467 61 100 22];
            app.Preset4Button.Text = 'Preset 4';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = AudioEqualizer_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end