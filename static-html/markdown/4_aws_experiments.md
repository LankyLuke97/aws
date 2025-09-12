## Why do my friends not know what an IP address or a port is?

As part of the last article, I pinged my brother and another non-tech related friend to test that they could also access the static website running on the the cloud-provisioned server. I then experienced a slightly dissociative moment as they both failed to access it - but only because they didn't know how to write the IP address and follow it with a port number, separated by a colon, *even though I literally wrote it out and they just had to copy and paste it*. It's a good reminder of the things you take for granted, and also to remember that other people think the same of you with regards to their domain.  

Anyway, I guess I should sort some DNS resolution for this bad boy.  

## Where did you come from, where did you go?

First thing is an Elastic IP. It may just be me, but for some reason, the service name Elastic IP made me presume this was a dynamic IP that changed? Actually, let me look it up, why did they call it that...  

From Reddit - "if we are going to start nitpicking AWS service names we will be here all night".  

Ok, fair enough.  

So, I need an Elastic IP, which is actually a static IP. Why do I need that? Because otherwise the public IP associated with the EC2 instance will change every time that instance stops and starts, which means crucial things like DNS resolution will not, in any real sense, work. If I'm going to point a URL to an IP address, I would like that address to be there all the time.  

Something I find interesting about the Elastic IP service is that you pay for each IP, but only when they are *not allocated* to a machine. As soon as they're allocated, they're free again (in the free tier that I'm using, at least - I couldn't comment on the paid tier, yet). It's a neat way to disincentivise hoarding whilst still allowing general use.  

How do I allocate an Elastic IP? It turns out to be pretty easy, actually. First, check that my EC2 instance is running, which it is, even though I thought I stopped it, whoops.  

Second, create an Elastic IP, which is termed 'allocating' and is pretty much a one-click affair.  
h I think I can probably cope with.  
> Also, good to know that my billing warnings do, in fact, work.  

## I'm travelling down Route 53


