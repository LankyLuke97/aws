# A Box of Qualities

I'm currently moving flat; this is a record for both my partner and I, as we've lasted nineteen months in the current flat. I believe the record prior to this was fifteen months for me and eleven months for my partner. As part of the move, we had to order some new boxes from Amazon, as we'd kept none of those we'd used in the move here. There's something strange about having twenty cardboard boxes delivered in one large cardboard box, a mothership of sorts, but such is the modern world.  

Upon opening the box of boxes and beginning to assemble one of the diminutive boxes held therein to prepare for the move, I found this on its underside:  
[Image of a box with a caricature of the underside of a vehicle](images/box_image.png)  
If you excuse the poor image quality and the poor cropping, and inspect instead the box, you might well see what made me laugh: someone took their time with this.  

## 1. Why do you try my patience?

In my day job, I'm technically a DevOps engineer. I don't know what that means in relation to the broader market, but in the company I work for, this ostensibly translates to managing upgrades of our application within client environments, working with clients to build out infrastructure for the application, developing our deployment tools to support ongoing development, and working to provide internal tooling to make everyone's lives easier and quicker. In practice, I spend 30-40% of my time begging people to use their fucking brains.  

Just today, I had a call with a new client; it was about building out the infrastructure required so they could start doing 'gap analysis' on our software. They spoke mostly of approval boards and processes, little of the actual infrastructure. At one point, one of our opposite number said the sentence, "We'll need to get the POC-SAD to the ARB to have the infra in place before the change freeze at the end of June."  

It's May. We're telling them they need five small servers. What the fuck is a POC-SAD and an ARB? I don't know, but everyone on their side nodded seriously while myself and our CTO looked somewhere between a mix of concerned and bewildered. Why does it take 3 weeks to build those servers? I could do it in 10 minutes with Terraform, and that's not even my job.  

At some point after that call, we had an email from what I would term a 'problematic team' within our company.  

Why are they problematic? They refuse to do anything modern; their libraries and dependencies are all out of date and only update once a customer flags it in a security scan, they refuse to use software like gradle, ant, or maven to build their portion of the application and so sections are frequently missing or delivered incorrectly, and this is worsened by their insistence that using timestamped folders on a network drive as a substitute for version control is "quicker", despite the astounding frequency with which this causes issues. My brother jokingly insists that this is good practice, but he is not employed in a role where this is an issue and instead inflicts it on his own personal projects, and I can therefore forgive, if not forget.  

This email, shockingly (in that I have seen far too many like it), was to enquire whether we'd delivered some artifacts as expected to a customer system, as it wasn't working as intended. We hadn't; arbitrarily, they'd built the software in a different format and so our automated pipelines hadn't picked them up. The reason this had happened on our side is because we have very strict filters for only their software; they frequently leave random crap in the folders, so we can't just pick up the whole folder as we can with other teams.  

As is par for the course, that version of the software has already been signed off as 'complete', despite lacking some fundamental functionality, and been delivered to clients. The compliance machine decrees, therefore, that we cannot simply correct matters, but must instead deliver afresh. How did it get signed off as complete when it's missing this functionality? This team has no tests of any kind and insists that it's not possible to develop some...even though it plainly is possible.  

There is no response to my somewhat irritated but generally polite email suggesting, yet again, that we need to work together to automate this process.  

## 2. What's with the box?

I came home after this exchange of emails, yet again begging a team of well-paid developers to do the bare fucking minimum, and looked at those boxes again. There's three on my living room floor, quite full of books and some jackets; the rest of them will be filled this week. When I opened them and saw the image on the bottom, and the other details all around it, my partner commented that they weren't surprised with how much I enjoyed them and paused to consider them; they said that, "You just love good quality work."  

Objectively, cardboard boxes are boring. I buy them, I tape them up, I put stuff in them, I tape them some more, I hope they don't break or get rained on during transportm, I dispose of them post-move. At this point, cardboard boxes and I have a very transactional relationship, and I'm ok with that.  

Someone, somewhere, has decided that this was insufficient. They have taken the time to design all the sides of this box so that it useful, so that it made me laugh while assembling it, so that it is easy to carry and easy to track the contents. My life has been made marginally but measurably better this week by the actions of someone who will never know, but who decided to do their job well. Why is it so hard for others to do the same?
