#require 'color'

module Color
  class RGB

  # Outputs how much contrast this color has with another rgb color. Computes the same
  # regardless of which one is considered foreground. 
  # If the other color does not have a to_rgb method, this will throw an exception
  # anything over about 0.22 should have a high likelihood of begin legible. 
  # otherwise, to be safe go with something > 0.3   
  def contrast(other_rgb)
    if other_rgb.respond_to? :to_rgb then
      c2 = other_rgb.to_rgb
    else
      raise "rgb.rb unable to calculate contrast with object #{other_rgb.to_s}"
    end 
    #the following numbers have been set with some care.
    return ( 
    self.diff_bri(other_rgb)*0.65 + 
    self.diff_hue(other_rgb)*0.20 + 
    self.diff_lum(other_rgb)*0.15 ) 
  end

  
  #provides the luminosity difference between two rbg vals 
  def diff_lum(rgb)
    rgb=rgb.to_rgb
	  l1 = 0.2126 * (rgb.r) ** 2.2 +
         0.7152 * (rgb.b) ** 2.2 +
         0.0722 * (rgb.g) ** 2.2;
 
    l2 = 0.2126 *  (self.r) ** 2.2 +
          0.7152 * (self.b) ** 2.2 +
          0.0722 * (self.g) ** 2.2;
      
     return ( ( ([l1,l2].max) + 0.05 )/ ( ([l1,l2].min) + 0.05 ) - 1 ) / 20  
  end 
  
  #provides the brightness difference. 
  def diff_bri(rgb)
    rgb=rgb.to_rgb
 		br1 = (299 * rgb.r + 587 * rgb.g + 114 * rgb.b) ;
		br2 = (299 * self.r + 587 * self.g + 114 * self.b) ;
		return (br1-br2).abs/1000; 
  end

  #provides the euclidean distance between the two color values 
  def diff_pyt(rgb)
    rgb=rgb.to_rgb
    (((rgb.r - self.r)**2 + 
    (rgb.g - self.g)**2 + 
    (rgb.b - self.b)**2)**0.5)/(1.7320508075688772)
  end

  #difference in the two colors' hue 
  def diff_hue(rgb)
    rgb=rgb.to_rgb
    return ((self.r-rgb.r).abs +
           (self.g-rgb.g).abs +
           (self.b-rgb.b).abs)/3 
  end 

=begin
  #returns a random number distributed about a mean (in [0..1) )
  def next_gaussian(mean)
    begin
      w1 = (rand - 0.5) 
      w2 = (rand - 0.5)
      w = w1**2 + w2**2
    end while w >= 0.5 || w <= 0
#    y = -Math.log(rand)
    y = (-1*(Math.log(w)))**0.5
    y=y*w2
    # so now y should be in [-0.5 .. 0.5]
    y= y + mean
    y= y > 1.0 ? 1.0 : y
    y= y < 0.0 ? 0.0 : y
   # puts "next_gaussian: "+ y.to_s
    return y
  end 
=end

  #returns a random number distributed about a mean (in [0..1) )
  #hopefully this algorithm delivers numbers more tightly clustered about their mean
  def next_gaussian(mean)
    y = (-(1.0/8.0)*(Math.log(rand)))
    y = rand >= 0.5 ? y : -y
    # so now y should be in [-0.5 .. 0.5]
    y= y + mean
    y= y > 1.0 ? 1.0 : y
    y= y < 0.0 ? 0.0 : y
   # puts "next_gaussian: "+ y.to_s
   
    return y
  end 

  end #class RGB
end #module Color
