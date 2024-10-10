% optimal
comp_settings("Optimal",-7,2.6,17,0.007,0.09,1);


% function that writes the compressed files
function C = comp_settings(prefix,T,Ra,K,A,Re,M)
    % Initialize Frames and Filepath and Read and Write Audio Files
    frames = 1024;
    audio_folder = 'RAW_MUSIC_DATA';
    wav_files = dir(fullfile(audio_folder,'*.wav'));
    for i = 1:length(wav_files)
        wav_file = fullfile(audio_folder,wav_files(i).name);
        wav_file_name = wav_files(i).name;
        output_file_path = fullfile('Compressed_Data',prefix ,prefix + "_" + wav_file_name + ".wav");
    
        % Read the File
        file_read = dsp.AudioFileReader( ...
            'Filename',wav_file, ...
            'SamplesPerFrame',frames);
    
        % Set Up Compressor Function
        COMP = compressor(...
            'Threshold',T, ...
            'Ratio',Ra, ...
            'KneeWidth',K, ...
            'AttackTime',A, ...
            'ReleaseTime',Re,...
            'MakeUpGain',M,...
            'SampleRate', file_read.SampleRate);
        
        compressed_audio_data = [];
    
        % Main
        while ~isDone(file_read)
            x = file_read();
            [y,g] = COMP(x);
            compressed_audio_data = [compressed_audio_data;y];
        end
        
        release(COMP);
        release(file_read);
    
        audiowrite(output_file_path, compressed_audio_data, file_read.SampleRate);
    end
    C = 1;
end