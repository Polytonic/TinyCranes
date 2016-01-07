---
title: Trivially Parallel
datetime: 2015-05-20 20:04:19 -0400
---
Having just finished a semester studying concurrency, I thought it would be fun to dig into the backlog and write a post on parallel computing. In the past, writing a program might have involved message passing or threading. Today, the widespread availability of graphics coprocessors effectively places immense, parallel computing power in the hands of every teenager clutching a smartphone, and more.

As a student with limited resources, I prefer tackling a subset of [embarrassingly parallel](http://en.wikipedia.org/wiki/Embarrassingly_parallel) problems that I call *trivially parallel*. These are problems that benefit from parallelization without necessarily requiring supercomputing levels of hardware. A simple example might be matrix multiplication, or even more basic, swapping the contents of two arrays.

This is the point where I declare [OpenCL](https://www.khronos.org/opencl/) a horrible mess. You can read more about the [Quest for the Smallest OpenCL Program](http://arrayfire.com/quest-for-the-smallest-opencl-program/) to get a sense of all the hoops you have to jump through just to do basic math. You could start with the 37 line example. It is quite basic, and difficult to expand upon. Not impossible, but there is an easier way!

I wrote [Chlorine](https://github.com/Polytonic/Chlorine) as a simpler way to interact with devices. The goal is for you to work with your data, not fight with hardware interfaces. How does it work? The following is a line-by-line explanation of the [swap example](https://github.com/Polytonic/Chlorine/tree/master/examples/swap) on the [project homepage](https://github.com/Polytonic/Chlorine#getting-started).

Start by including the Chlorine header.

```c++
#include "chlorine.hpp"
```

Now we create some dummy data. While this example uses `std::vector` for brevity, you can freely mix and match containers of any type. This can be useful if you need to mix bounded and unbounded array types.

```c++
// Create Some Data
std::vector<float> spam(10, 3.1415f);
std::vector<float> eggs(10, 2.7182f);
```

Next, we create a Chlorine Worker, using the filename constructor, which takes a path to an OpenCL kernel file.

```c++
// Initialize a Chlorine Worker
ch::Worker worker("swap.cl");
```

Now that our worker is aware of kernel functions, we can simply invoke `Worker::call(kernel_function, ... )` with the first argument being the name of the kernel function you wish to call, followed by the same arguments (in the same order!) as the kernel function.

```c++
// Call the Swap Function in the Given Kernel
worker.call("swap", spam, eggs);
```

After this completes, data is automatically written back to the same memory locations allocated by your program.

```c++
// Host Containers Are Automatically Updated
std::cout << "Spam: " << spam[0] << "\n"; // 2.7182
std::cout << "Eggs: " << eggs[0] << "\n"; // 3.1415
```

Don't take my word for it though! If you build and run this example, you'll see that the values in each array have been swapped. In order for this to compile, we need to link with the system installation of OpenCL. We also need to pass `-std=c++11` to the compiler to enable variadic templating in Chlorine. You should end up with something like this:

```bash
$ clang++ -std=c++11 swap.cpp -lOpenCL  # Compile
$ ./a.out                               # and Run
```

Timing is built in, so you can also effortlessly recover profiling data! Chlorine Workers return an OpenCL event associated with the kernel function call. This allows you to recover profiling data, such as how much time was spent executing the kernel function.

```c++
// Store the Returned OpenCL Event Object
auto event = worker.call("swap", spam, eggs);
```

To make things easier, there is a helper function `ch::elapsed()` which accepts an OpenCL event and returns the elapsed time spent on your kernel function. This helper preserves the nanosecond resolution offered by the OpenCL API and is merely a convenience wrapper.

```c++
// Print Some Profiling Data
std::cout << "Elapsed Time: " << ch::elapsed(event) << "ns\n";
```

Kernel files are written in a variant of the C programming language. While I won't go into detail about it here, I hope this serves as a valuable demonstration in how Chlorine may be used to easily port code to run in parallel. Up next: [Visualizing the Mandelbrot Set](/blog/2015/05/visualizing-the-mandelbrot-set/).
