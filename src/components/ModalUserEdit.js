import * as React from 'react';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import { Label } from '@mui/icons-material';
import { Box, CircularProgress, FormControl, Input, InputAdornment, InputLabel, TextField } from '@mui/material';
import AccountCircle from '@mui/icons-material/AccountCircle';
import Email from '@mui/icons-material/Email';
import Tty from '@mui/icons-material/Tty';
import Badge from '@mui/icons-material/Badge';
import useFormStyles from '../styles/useFormFields';
import usePostUsers from '../service/usePostUser';
import { green } from '@mui/material/colors';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
const ModalUserEdit = ({ setopenModal = () => { }, openModal = () => { }, setdataSet = () => { }, dataSet = () => { }, setvalidationService = () => { } }) => {
    console.log("dataSet", dataSet);
    const classes = useFormStyles()
    const service = new usePostUsers();
    const [email, setemail] = React.useState(dataSet?.email ?? null);
    const [phoneNumber, setphoneNumber] = React.useState(dataSet?.phoneNumber ?? null);
    const [cc, setcc] = React.useState(dataSet?.cc ?? null);
    const [name, setname] = React.useState(dataSet?.name ?? null);
    const [lastname, setlastname] = React.useState(dataSet?.lastName ?? null);
    const [loading, setLoading] = React.useState(false);
    const [success, setSuccess] = React.useState(false);
    const timer = React.useRef();
    const handleClose = () => {
        setopenModal(false);
    };
    React.useEffect(() => {
        if (openModal == true) {
            setemail(dataSet?.email ?? null);
            setphoneNumber(dataSet?.phoneNumber ?? null);
            setcc(dataSet?.cc ?? null);
            setname(dataSet?.name ?? null);
            setlastname(dataSet?.lastName ?? null);
        }
    }, [openModal == true])
    const updateUser = async (event) => {
        event.preventDefault()
        if (!loading) {
            setSuccess(false);
            setLoading(true);
        }
        let jsonSet = {
            name: name ?? '',
            lastName: lastname ?? '',
            email: email,
            phoneNumber: phoneNumber,
            cc: cc,
            _id: dataSet?._id
        }
        await service.updateUsers(jsonSet).then(response => {
            if (response == true) {
                setvalidationService(false)
                toast.success("Usuario actualizado exitosamente!");
                setTimeout(() => {
                    setvalidationService(true)
                    handleClose()
                }, 500);
            } else {
                toast.error("Oops!, ha ocurrido un error en la respuesta del servicio.");
            }
            setSuccess(true);
            setLoading(false);
        })
    }

    return (
        <React.Fragment>
            <Dialog
                open={openModal}
                onClose={handleClose}
                aria-labelledby="alert-dialog-title"
                aria-describedby="alert-dialog-description"
            >
                <form
                    onSubmit={updateUser}
                >
                    <DialogTitle id="alert-dialog-title">
                        {"Actualización de usuario"}
                    </DialogTitle>
                    <DialogContent>
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
                    </DialogContent>
                    <DialogActions>
                        <Button onClick={handleClose}>Cancelar</Button>
                        <Box sx={{ display: 'flex', alignItems: 'center' }}>
                            <Box sx={{ m: 1, position: 'relative' }}>
                                <Button
                                    disabled={email == null || email == '' || phoneNumber == null || phoneNumber == '' || cc == null || cc == '' ? true : loading == true ? true : false}
                                    variant="contained"
                                    type="submit"
                                // onClick={updateUser}
                                >
                                    Actualizar
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
                    </DialogActions>
                </form>
            </Dialog>
            <ToastContainer />
        </React.Fragment >
    );
}
export default ModalUserEdit

