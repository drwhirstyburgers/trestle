class BugReportMailer < ApplicationMailer
    default from: "bugs@trestle.education"

    def new_bug(bug, user)
        puts "HELLO"
        headers["Message-ID"] = "<bugs/#{bug.id}@trestle.education>"
        headers["In-Reply-To"] = "<bugs/#{bug.id}@trestle.education>"
        headers["References"] = "<bugs/#{bug.id}@trestle.education>"

        @bug = bug
        @user = user

        mail(to: "dave.hirst50@gmail.com", subject: "New bug #{bug.subject}")
    end
end
