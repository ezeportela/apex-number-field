const createNumberField = (
  { 
    affectedElements 
  }, 
  {
    allowDecimals, 
    decimalSeparator, 
    allowNegatives
  }
) => {

  const contains = (text, search) => text.split(search).length - 1 > 0

  for (element of affectedElements) {
    
    $(element).on('keypress', event => {
      
      const inputValue = event.target.value
      $(event.target).addClass('plugin-number-field')
  
      if (event.keyCode >= 48 && event.keyCode <= 57)
        return true
  
      if (allowDecimals === 'Y'
          && event.keyCode === decimalSeparator.charCodeAt(0)
          && !contains(inputValue, decimalSeparator))
        return true
  
      if(allowNegatives === 'Y'
          && event.keyCode === 45) {
        
        event.target.value = contains(inputValue, '-') 
                                ? inputValue.replace('-', '') 
                                : '-' + inputValue
        
        return false
      }
  
      return false
    })
  }
}