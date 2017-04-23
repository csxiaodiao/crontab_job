set :output, {:error => 'log/crontab_jobs_error.log', :standard => 'log/crontab_jobs.log'}

job_type :command, ":task :output"

every :day, :at => '10:00 pm' do
  command "/Users/csxiaodiao/Script/crontab_job/crontab_jobs.sh"
end




