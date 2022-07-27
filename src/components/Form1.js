import {
  TextField,
  Button,
  Box,
  FormControl,
  InputLabel,
  Input,
  InputAdornment
} from '@mui/material'
import React from 'react';
import Validations from '../custom/validationInput';
import useFormStyles from '../styles/useFormFields'
import AccountCircle from '@mui/icons-material/AccountCircle';
const Form1 = ({ setStep = () => { }, setjsonUser = () => { }, jsonUser = () => { } }) => {
  const validations = new Validations();
  const [name, setname] = React.useState(jsonUser?.name ?? null);
  const [lastname, setlastname] = React.useState(jsonUser?.lastName ?? null);
  const onSubmit = (event, values) => {
    event.preventDefault()
    setjsonUser({ ...jsonUser, name: name, lastName: lastname })
    setStep(1)
  }

  return (
    <form
      onSubmit={onSubmit}
    >
      <Box sx={{ '& > :not(style)': { m: 1 } }}>
        <FormControl variant="standard">
          <InputLabel htmlFor="input-with-icon-adornment">
            Nombres
          </InputLabel>
          <Input
            id="input-with-icon-adornment"
            onChange={(e) => { setname(e.target.value) }}
            defaultValue={name ?? ''}
            inputProps={{ pattern: "[^0-9]*" }}
            startAdornment={
              <InputAdornment position="start">
                <AccountCircle />
              </InputAdornment>
            }
          />
        </FormControl>
        <FormControl variant="standard">
          <InputLabel htmlFor="input-with-icon-adornment">
            Apellidos
          </InputLabel>
          <Input
            id="input-with-icon-adornment"
            inputProps={{ pattern: "[^0-9]*" }}
            onChange={(e) => { setlastname(e.target.value) }}
            defaultValue={lastname ?? ''}
            startAdornment={
              <InputAdornment position="start">
                <AccountCircle />
              </InputAdornment>
            }
          />
        </FormControl>
      </Box>
      <Button
        disabled={name == null || name == '' || name.length == 0 || lastname == null || lastname == '' || lastname.length == 0 ? true : false}
        variant="contained"
        type="submit"
      >
        Siguiente
      </Button>
    </form>
  )
}

export default Form1
