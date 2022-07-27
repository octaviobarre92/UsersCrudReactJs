import {
  TextField,
  Button
} from '@mui/material'
import React from 'react';
import usePostUsers from '../service/usePostUser';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import useFormStyles from '../styles/useFormFields'
import { green } from '@mui/material/colors';
import { Box, CircularProgress, FormControl, Input, InputAdornment, InputLabel } from '@mui/material';
import AccountCircle from '@mui/icons-material/AccountCircle';
import Email from '@mui/icons-material/Email';
import Tty from '@mui/icons-material/Tty';
import Badge from '@mui/icons-material/Badge';
const Form2 = ({ setStep = () => { }, setjsonUser = () => { }, jsonUser = () => { }, validationService = () => { }, setvalidationService = () => { } }) => {
  const classes = useFormStyles();
  const service = new usePostUsers();
  const [email, setemail] = React.useState(jsonUser?.email ?? null);
  const [phoneNumber, setphoneNumber] = React.useState(jsonUser?.phoneNumber ?? null);
  const [cc, setcc] = React.useState(jsonUser?.cc ?? null);
  const [loading, setLoading] = React.useState(false);
  const [success, setSuccess] = React.useState(false);
  const timer = React.useRef();
  const buttonSx = {
    ...(success && {
      bgcolor: green[500],
      '&:hover': {
        bgcolor: green[700],
      },
    }),
  };
  const onSubmit = async (event) => {
    event.preventDefault()
    setjsonUser({ ...jsonUser, email: email, phoneNumber: phoneNumber, cc: cc })
    if (!loading) {
      setSuccess(false);
      setLoading(true);
    }
    let jsonSet = {
      name: jsonUser?.name ?? '',
      lastName: jsonUser?.lastName ?? '',
      email: email,
      phoneNumber: phoneNumber,
      cc: cc,
    }
    await service.saveUsers(jsonSet).then(response => {
      if (response == true) {
        setvalidationService(false)
        setjsonUser({ email: null, phoneNumber: null, cc: null, name: null, lastName: null })
        setemail(jsonUser?.email ?? null);
        setphoneNumber(jsonUser?.phoneNumber ?? null);
        setcc(jsonUser?.cc ?? null);
        setStep(0);
        toast.success("Usuario registrado exitosamente!");
        setTimeout(() => {
          setvalidationService(true)
        }, 500);
      } else {
        toast.error("Oops!, ha ocurrido un error en la respuesta del servicio.");
      }
      setSuccess(true);
      setLoading(false);
    })
  }
  React.useEffect(() => {
    return () => {
      clearTimeout(timer.current);
    };
  }, []);
  return (
    <>
      <form
        onSubmit={onSubmit}
      >
        <Box sx={{ '& > :not(style)': { m: 1 } }}>
          <FormControl variant="standard">
            <InputLabel htmlFor="input-with-icon-adornment">
              Email
            </InputLabel>
            <Input
              id="input-with-icon-adornment"
              onChange={(e) => { setemail(e.target.value) }}
              type="email"
              defaultValue={email ?? ''}
              startAdornment={
                <InputAdornment position="start">
                  <Email />
                </InputAdornment>
              }
            />
          </FormControl>
          <FormControl variant="standard">
            <InputLabel htmlFor="input-with-icon-adornment">
              Teléfono
            </InputLabel>
            <Input
              id="input-with-icon-adornment"
              inputProps={{ pattern: "^[0-9]*" }}
              onChange={(e) => { setphoneNumber(e.target.value) }}
              defaultValue={phoneNumber ?? ''}
              startAdornment={
                <InputAdornment position="start">
                  <Tty />
                </InputAdornment>
              }
            />
          </FormControl>
          <FormControl variant="standard">
            <InputLabel htmlFor="input-with-icon-adornment">
              Documento de identidad
            </InputLabel>
            <Input
              id="input-with-icon-adornment"
              inputProps={{ pattern: "^[0-9-]*" }}
              onChange={(e) => { setcc(e.target.value) }}
              defaultValue={cc ?? ''}
              startAdornment={
                <InputAdornment position="start">
                  <Badge />
                </InputAdornment>
              }
            />
          </FormControl>
        </Box>
        <Button
          className={classes.formButtons}
          variant="outlined"
          onClick={() => {
            setjsonUser({ ...jsonUser, email: email, phoneNumber: phoneNumber, cc: cc })
            setStep(0);
          }}
        >
          Anterior
        </Button>
        <Box sx={{ display: 'flex', alignItems: 'center' }}>
          <Box sx={{ m: 1, position: 'relative' }}>
            <Button
              disabled={email == null || email == '' || phoneNumber == null || phoneNumber == '' || cc == null || cc == '' ? true : loading == true ? true : false}
              variant="contained"
              type="submit"
            >
              Enviar
            </Button>
            {loading && (
              <CircularProgress
                size={24}
                sx={{
                  color: green[500],
                  position: 'absolute',
                  top: '50%',
                  left: '50%',
                  marginTop: '-12px',
                  marginLeft: '-12px',
                }}
              />
            )}
          </Box>
        </Box>
      </form>
      <ToastContainer />
    </>
  )
}

export default Form2
