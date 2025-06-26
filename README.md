# FIR_FILTER

*COMPANY* : CODTECH IT SOLUTIONS

*NAME* : MIDATHANA MOULI

*INTERN ID* : CT06DN38

*DOMAIN* :  VLSI

*DURATION* : 6 WEEKS

*MENTOR* : NEELA SANTOSH

I have successfully completed the task of designing and implementing a FIR FILTER by utilising ChatGPT to  clarify certain concepts and to rectify a few errors. which helped me improve the overall functionality and correctness of the design.

A FIR (Finite Impulse Response) filter processes a digital input signal to remove unwanted frequency components or shape the signal. It does this by convolving the input with a fixed set of coefficients.
The output of an FIR filter at time  is a weighted sum of the current and past input values

for a 4 tapped filter output is y[n] = h[0]x[n] + h[1]x[n-1] + h[2]x[n-2]+h[3]x[n-3].

This FIR (Finite Impulse Response) filter takes an 8-bit input x_in and produces an 8-bit filtered output y_out. The filter uses a set of predefined coefficients stored in the coeff array. It maintains a register array x to store the current and past input samples (acts as a shift register).

On each positive clock edge:

The latest input x_in is loaded into x[0], and previous values are shifted rightward.

Then, each stored sample is multiplied with the corresponding coefficient.

The multiplication results are summed and assigned to the variable sum.


Finally, the upper 8 bits of this sum (from bit 15 to bit 8) are assigned to the output y_out, effectively truncating and scaling the result to fit into 8 bits.

If the reset (rst) is low (active-low), both the shift registers and output are cleared to zero.



# OUTPUT :
![FIR_FILTER_RTL_SCHEMATIC.png](https://github.com/user-attachments/assets/7de3e719-be44-4754-b6e9-6773fb1e9bd2)


![fir_filter_wave_forms.png](https://github.com/user-attachments/assets/4257b47a-8c17-4daa-be52-c65c1dd68623)

![FIR_FILTER_TCL_CONSOLE_OUTPUT.png](https://github.com/user-attachments/assets/b53617ea-c527-4c6a-a2f3-c454d38a9dee)




