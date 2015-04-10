# [TinyCranes](//www.tinycranes.com/)
[![Dependency Status](http://img.shields.io/gemnasium/Polytonic/TinyCranes.svg?style=flat-square)](https://gemnasium.com/Polytonic/TinyCranes)

## Summary
This is the full source code for my personal website. It's a bit of a mess, but if you were interested, here you go.

## Getting Started
Begin by setting the Google Analytics tracking code and Typekit ID. This application intended for deploy-on-push to Heroku, so you'll need to have an account there. Once the application is up and running, you'll need to set `NODE_ENV` to `production` to enable caching and other performance enhancements. For New Relic to work, set `NEW_RELIC_NO_CONFIG_FILE` to `true`

## Documentation
I use a hybrid static/dynamic architecture. My original version was statically compiled using CodeKit, so portions of this are an artifact of that. Over time, the warts in this codebase should disappear. At some point, I'll document my source code with some sort of annotated viewer. Likely [groc](//github.com/nevir/groc) or [slate](//github.com/tripit/slate).

## License
>The MIT License (MIT)

>Copyright (c) 2015 Kevin Fung

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
