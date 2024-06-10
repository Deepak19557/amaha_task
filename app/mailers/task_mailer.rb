# app/mailers/task_mailer.rb
class TaskMailer < ApplicationMailer
  def deadline_alert(task)
    @task = task
    mail(to: @task.user.email, subject: "Task Deadline Alert!")
  end
end
