import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  TableFooter
} from '@mui/material'
import Fab from '@mui/material/Fab';
import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';
import useUsers from '../hooks/useUsers'
import LoadingOverlay from 'react-loading-overlay';
import React from 'react';
import usePostUsers from '../service/usePostUser';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import ModalUserEdit from './ModalUserEdit';
import Pagination from '@mui/material/Pagination';
import Stack from '@mui/material/Stack';
const TableData = ({ validationService = () => { }, setvalidationService = () => { } }) => {
  const { users } = useUsers()
  const [openModal, setopenModal] = React.useState(false);
  const [skip, setskip] = React.useState(0);
  const [loadingValidate, setloadingValidate] = React.useState(false);
  const [limit, setlimit] = React.useState(5);
  const [dataUsers, setdataUsers] = React.useState(null);
  const [dataSet, setdataSet] = React.useState({});
  const service = new usePostUsers();
  React.useEffect(() => {
    setTimeout(() => {
      setvalidationService(true)
      initialPagination();
    }, 500);
  }, [users])
  async function initialPagination() {
    setloadingValidate(true)
    await service.getUsersPagination(skip, 5).then(resp => {
      setdataUsers(resp)
      setloadingValidate(false)

    }).catch(err => {
      setloadingValidate(false)
    })
  }
  async function changuePage(pageNumber) {
    setloadingValidate(true)
    await service.getUsersPagination(pageNumber == 1 ? 0 : (pageNumber * limit - limit), limit).then(resp => {
      setdataUsers(resp)
      setloadingValidate(false)
    }).catch(err => {
      setloadingValidate(false)
    })
  }
  return (
    <>
      <LoadingOverlay active={loadingValidate} spinner text={("Procesando informacion, espere por favor..")}></LoadingOverlay>
      <TableContainer
        component={Paper}
      >
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>
                <strong>Nombre</strong>
              </TableCell>
              <TableCell>
                <strong>Apellido</strong>
              </TableCell>
              <TableCell>
                <strong>E-mail</strong>
              </TableCell>
              <TableCell>
                <strong>Teléfono</strong>
              </TableCell>
              <TableCell>
                <strong>C.C.</strong>
              </TableCell>
              <TableCell>
                <strong>Acciones</strong>
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {dataUsers && dataUsers.map((user, key) => (
              <TableRow
                key={key}
              >
                <TableCell>
                  {user.name}
                </TableCell>
                <TableCell>
                  {user.lastName}
                </TableCell>
                <TableCell>
                  {user.email}
                </TableCell>
                <TableCell>
                  {user.phoneNumber}
                </TableCell>
                <TableCell>
                  {user.cc}
                </TableCell>
                <TableCell>
                  <Fab onClick={(e) => { setdataSet(user); setopenModal(true); }} size="small" color="secondary" aria-label="edit">
                    <EditIcon />
                  </Fab>
                  <Fab onClick={async (e) => {
                    try {
                      setvalidationService(false)
                      await service.deleteUsers(user._id).then(response => {
                        if (response == true) {
                          toast.success(`Exito al eliminar al usuario ${user.name} ${user.lastName ?? ''}`);
                          setTimeout(() => {
                            setvalidationService(true)
                            return false
                          }, 500);
                        } else {
                          toast.error(`Oops!, ha ocurrido un error en la respuesta del servicio.`);
                        }
                      })
                    } catch (err) {
                      console.log(err);
                    }
                  }} size="small" color="error" aria-label="delete">
                    <DeleteIcon />
                  </Fab>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
          <TableFooter>
            <TableRow>
              <TableCell colSpan={5}>
                <Stack spacing={2}>
                  <Pagination count={Math.ceil(users.length / 5) ?? 0} onChange={(e, page) => { changuePage(page) }} variant="outlined" shape="rounded" />
                </Stack>
              </TableCell>
            </TableRow>
          </TableFooter>

        </Table>
        <ToastContainer />
      </TableContainer>
      <ModalUserEdit setopenModal={setopenModal} openModal={openModal} setdataSet={setdataSet} dataSet={dataSet} setvalidationService={setvalidationService} />
    </>
  )
}

export default TableData
