# Active Harmony

## What does it do

Active Harmony is a Ruby library for synchronizing Ruby objects with remote REST services. 

Synchronizing just objects doesn't make much sense - so Active Harmony expects that you will use some persistance layer for your Ruby objects. For now, we support Mongoid, but you can easily code support for your favorite persistance layer. (Mongoid support is 30 lines - see synchronizable/harmony.rb)

## How to use it

### Installing

First, add Active Harmony to your Gemfile

    gem 'active_harmony', :git => 'git://github.com/vojto/active_harmony.git'
    
### Setting up services

Before you move on to your objects, you need to setup a remote service. 

Start by initializing new Service Manager. This will be object that knows about all services. If you're using Rails, you can add this to your initializers:

    SERVICE_MANAGER = ActiveHarmony::ServiceManager.new
    
You will need to access manager in your models later - to setup synchronization with the service. But, customize your service first:

    my_service.base_url = 'http://myservice.com/api'
    my_service.header['MyServiceKey'] = 'abcdef'
    
Service allows more customization, like adding authentication, changing paths, and so on. See documentation for ActiveHarmony::Service for more information. 

You might want to know, that service supports only XML type of requests/responses for now. XML path for finding entities in XML responses is also one of the things you can customize on Service class.

Now you need to add your newly created service to your manager.

    SERVICE_MANAGER.add_service_for_identifier(my_service, :my_service)

### Setting up Ruby objects

Setup your Ruby object that will by synced. These lines set up persistence using Mongoid and include two classes from Active Harmony: Core adds basic synchronizable functionality, and Mongoid extends this to Mongoid persistence layer.

    class Bacon
      include Mongoid::Document
      
      include ActiveHarmony::Synchronizable::Core
      include ActiveHarmony::Synchronizable::Mongoid
      
      field :tastyness
    end
    
    

### Assigning Service to Ruby objects

Now you have added services to your managers, and added synchronization capabilities to your objects. Last step is wiring things up together.

A good place to do this is your model, you'll see why:

    class Bacon
      synchronizer.service = \
        SERVICE_MANAGER.service_with_identifier :my_service
        
      synchronizer.configure do |config|
        config.synchronize :tastyness
      end
    end
    
As you can see, you're using class variable __synchronizer__. This variable was initialized for you when you included _Synchronizable::Core_, so you can change Service, or configure synchronizable fields.

### Synchronizing objects

Check out documentation of _Synchronizable::Core_ for methods you can use directly on your objects, or check out _Synchronizer_ class that has methods like pulling whole collection from remote server.

Here's a simple example of pushing local changes:

    chunky_bacon = Bacon.first
    chunky_bacon.push
    ActiveHarmony::Queue.instance.run
    
Please note that using Queue requires Mongoid. If you want to do an instant push, you can pass in true as argument to push:

    chunky_bacon.push(true)

# License

Copyright (c) 2010 Vojto Rinik

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Credits

* Vojto Rinik: vojto (at) rinik (dot) net
* Ryan Smith: ryandotsmith (at) gmail (dot) com